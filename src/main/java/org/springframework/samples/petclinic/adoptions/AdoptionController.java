package org.springframework.samples.petclinic.adoptions;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.booking.Booking;
import org.springframework.samples.petclinic.booking.BookingService;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.owner.OwnerService;
import org.springframework.samples.petclinic.pet.Pet;
import org.springframework.samples.petclinic.pet.PetService;
import org.springframework.samples.petclinic.user.User;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdoptionController {
    
    protected AdoptionService adoptionService;
    
    private PetService petService;

    private OwnerService ownerService;

    private UserService userService; 

    private AdoptionApplicationService adoptionApplicationService;

    private BookingService bookingService;

    protected final String ALL_ADOPTIONS="adoptions/findAllAdoptions";
    protected final String CREATION_ADOPTION_FORM = "adoptions/createAdoptionForm";
    protected final String ADOPTION_INFO = "adoptions/adoptionDetails";
    protected final String CREATION_APPLICATION_FORM = "adoptions/createApplicationForm";

    @Autowired
    public AdoptionController(AdoptionService adoptionService, OwnerService ownerService, PetService petService, 
    AdoptionApplicationService adoptionApplicationService, UserService userService, BookingService bookingService){
        this.adoptionService=adoptionService;
        this.ownerService = ownerService;
        this.petService = petService;
        this.adoptionApplicationService = adoptionApplicationService;
        this.userService=userService;
        this.bookingService = bookingService;
    }

    @ModelAttribute("loggedOwner")
    public Owner getLoggedOwner(){
        User loggedUser = userService.getLoggedUser().get();
        Owner loggedOwner = ownerService.findOwnerByUsername(loggedUser.getUsername());
        return loggedOwner;
    } 

    @Transactional(readOnly = true)
    @GetMapping(value= {"/adoptions/find"})
    public ModelAndView getAll(){
        List<Adoption> adoptions = adoptionService.getAll();
        ModelAndView result = new ModelAndView(ALL_ADOPTIONS);
        result.addObject("adoptions", adoptions);
        return result;
    }

    public Adoption getAdoption(Integer ownerId, Integer petId){
        Pet pet = petService.findPetById(petId);
        Owner owner = ownerService.findOwnerById(ownerId);
        Adoption adoption = new Adoption();
        adoption.setPet(pet);
        adoption.setPublishingOwner(owner);
        adoption.setAccepted(false);
        return adoption;
    }
    
    public AdoptionApplication getApplication(Integer newOwnerId, Integer adoptionId){
        AdoptionApplication application = new AdoptionApplication();
        Owner newOwner = ownerService.findOwnerById(newOwnerId);
        Adoption adoption = adoptionService.getAdoptionbyId(adoptionId);
        application.setAdoption(adoption);
        application.setOwner(newOwner);
        return application;
    }

    @Transactional(readOnly = true)
    @GetMapping("/owners/{ownerId}/pets/{petId}/adoption/new")
    public ModelAndView initCreateAdoptionForm(@PathVariable("ownerId") Integer ownerId, @PathVariable("petId") Integer petId,
    RedirectAttributes attributes){
        Adoption existingAdoption = adoptionService.getPendingdoptionsById(ownerId,petId);
        if(existingAdoption != null) {
            ModelAndView result = new ModelAndView("redirect:/adoptions/find");
            attributes.addFlashAttribute("message", "You have already put on adoption your pet");
            return result;
        }
        Adoption adoption = getAdoption(ownerId, petId);
        ModelAndView result = new ModelAndView(CREATION_ADOPTION_FORM);
        result.addObject("adoption", adoption);
        return result;
    }
    
    @Transactional
    @PostMapping("/owners/{ownerId}/pets/{petId}/adoption/new")
    public ModelAndView saveAdoption(@Valid Adoption adoption, BindingResult br, RedirectAttributes attributes, 
    @PathVariable("ownerId") Integer ownerId, @PathVariable("petId") Integer petId){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView(CREATION_ADOPTION_FORM, br.getModel());
            Adoption newAdoption = getAdoption(ownerId, petId);
            res.addObject("adoption", newAdoption);
            return res;
        }else{
            adoptionService.saveAdoption(adoption);
            res = new ModelAndView("redirect:/adoptions/find");
            attributes.addFlashAttribute("message", "The adoption was created successfully");
            return res;
        }
    }

    @Transactional(readOnly=true)
    @GetMapping("/adoptions/{adoptionId}")
    public ModelAndView redirectAdoption(@PathVariable("adoptionId") Integer adoptionId){
        Adoption adoption = adoptionService.getAdoptionbyId(adoptionId);
        return new ModelAndView("redirect:/owners/"+adoption.getPublishingOwner().getId()+"/pets/"+adoption.getPet().getId()
        + "/adoption/"+adoptionId);
    }

    @Transactional(readOnly=true)
    @GetMapping("/owners/{ownerId}/pets/*/adoption/{adoptionId}")
    public ModelAndView getAdoptionDetails(@PathVariable("ownerId") Integer ownerId,
    @PathVariable("adoptionId") Integer adoptionId) {
        ModelAndView result = new ModelAndView(ADOPTION_INFO);
        Adoption adoption = adoptionService.getAdoptionbyId(adoptionId);
        List<AdoptionApplication> adoptionApplications = adoptionApplicationService.getAdoptionApplicationByOwnerId(ownerId);
        result.addObject("adoption", adoption);
        result.addObject("applications", adoptionApplications);
        return result;
    }

    @Transactional(readOnly = true)
    @GetMapping("/owners/*/pets/*/adoption/{adoptionId}/applications/new/{newOwnerId}")
    public ModelAndView initCreateApplicationForm(@PathVariable("newOwnerId") Integer newOwnerId, 
    @PathVariable("adoptionId") Integer adoptionId, RedirectAttributes attributes){
        AdoptionApplication existingApplication = adoptionApplicationService.findExistingApplication(newOwnerId,adoptionId);
        if(existingApplication != null) {
            ModelAndView result = new ModelAndView("redirect:/adoptions/find");
            attributes.addFlashAttribute("message", "You have already added an application for this adoption");
            return result;
        }
        AdoptionApplication application =getApplication(newOwnerId, adoptionId);
        ModelAndView result = new ModelAndView(CREATION_APPLICATION_FORM);
        result.addObject("application",application);
        return result;
    }
    
    @Transactional
    @PostMapping("/owners/*/pets/*/adoption/{adoptionId}/applications/new/{newOwnerId}")
    public ModelAndView saveApplication(@Valid AdoptionApplication application, BindingResult br, RedirectAttributes attributes, 
    @PathVariable("adoptionId") Integer adoptionId, @PathVariable("newOwnerId") Integer newOwnerId){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView(CREATION_APPLICATION_FORM, br.getModel());
            AdoptionApplication newApplication = getApplication(newOwnerId, adoptionId);
            res.addObject("application", newApplication);
            return res;
        }else{
            adoptionApplicationService.saveAplication(application);
            res = new ModelAndView("redirect:/adoptions/find");
            attributes.addFlashAttribute("message", "The application was created successfully");
            return res;
        }
    }
    
    @Transactional
    @GetMapping("/owners/{ownerId}/pets/{petId}/adoption/{adoptionId}/applications/{newOwnerId}/accept")
    public ModelAndView acceptApplication(@PathVariable("ownerId") Integer ownerId, @PathVariable("petId") Integer petId,
    @PathVariable("adoptionId") Integer adoptionId, @PathVariable("newOwnerId") Integer newOwnerId){
        Pet pet = petService.findPetById(petId);
        Owner publisher = ownerService.findOwnerById(ownerId);
        Owner applicationOwner = ownerService.findOwnerById(newOwnerId);
        Adoption adoption = adoptionService.getAdoptionbyId(adoptionId);
        List<Booking> bookings = bookingService.getOwnerBookingsById(ownerId);
        publisher.removePet(pet);
        applicationOwner.addPet(pet);
        adoption.setAccepted(true);
        ownerService.saveOwner(applicationOwner);
        ownerService.saveOwner(publisher);
        for(Booking booking : bookings) {
            if(booking.getPet().getId().equals(petId)){
                bookingService.deleteBooking(booking);
            }
        }
        adoptionService.saveAdoption(adoption);
        return new ModelAndView("redirect:/adoptions/find");
    }
}
