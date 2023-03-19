package org.springframework.samples.petclinic.adoptions;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.owner.OwnerService;
import org.springframework.samples.petclinic.pet.Pet;
import org.springframework.samples.petclinic.pet.PetService;
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

    protected final String ALL_ADOPTIONS="adoptions/findAllAdoptions";
    protected final String CREATION_ADOPTION_FORM = "adoptions/createAdoptionForm";

    @Autowired
    public AdoptionController(AdoptionService adoptionService, OwnerService ownerService, PetService petService){
        this.adoptionService=adoptionService;
        this.ownerService = ownerService;
        this.petService = petService;
    }

    @Transactional(readOnly = true)
    @GetMapping(value= {"/adoptions"})
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

    @Transactional(readOnly = true)
    @GetMapping("/owners/{ownerId}/pets/{petId}/adoption/new")
    public ModelAndView initCreateAdoptionForm(@PathVariable("ownerId") Integer ownerId, @PathVariable("petId") Integer petId,
    RedirectAttributes attributes){
        Adoption existingAdoption = adoptionService.getPendingdoptionsById(ownerId,petId);
        if(existingAdoption != null) {
            ModelAndView result = new ModelAndView("redirect:/adoptions");
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
            res = new ModelAndView("redirect:/adoptions");
            attributes.addFlashAttribute("message", "The adoption was created successfully");
            return res;
        }
    }
}
