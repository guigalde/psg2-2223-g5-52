package org.springframework.samples.petclinic.booking;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.owner.OwnerService;
import org.springframework.samples.petclinic.pet.Pet;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.pet.PetService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BookingController {

    private BookingService bookingService;

    private PetService petService;

    private OwnerService ownerService;


    private String CREATION_BOOKING_FROM = "bookings/createBookingForm";

    @Autowired
    public BookingController(BookingService bookingService, OwnerService ownerService, PetService petService) {
        this.bookingService = bookingService;
        this.ownerService = ownerService;
        this.petService = petService;
    }

    @ModelAttribute("booking")
    public Booking getBooking(@PathVariable("petId") Integer petId, @PathVariable("ownerId") Integer ownerId) {
        Pet pet = petService.findPetById(petId);
        Owner owner = ownerService.findOwnerById(ownerId);
        Booking booking = new Booking();
        booking.setPet(pet);
        booking.setOwner(owner);
        return booking;
    }

    @InitBinder("booking")
	public void initBookingBinder(WebDataBinder dataBinder) {
		dataBinder.setValidator(new BookingValidator());
	}

    @Transactional(readOnly = true)
    @GetMapping(value = "/owners/{ownerId}/pets/{petId}/booking/new")
    public ModelAndView initCreateBookingForm(@PathVariable("petId") int petId, @PathVariable("ownerId") int ownerId) {
        ModelAndView res = new ModelAndView(CREATION_BOOKING_FROM);
        return res;
    }


    @Transactional
    @PostMapping("/owners/{ownerId}/pets/{petId}/booking/new")
    public ModelAndView saveBooking(@Valid Booking booking, BindingResult br, RedirectAttributes attributes){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView(CREATION_BOOKING_FROM, br.getModel());
            return res;
        }else{
            bookingService.saveBooking(booking);
            res = new ModelAndView("redirect:/owners/{ownerId}");
            attributes.addFlashAttribute("message", "The booking was created successfully");
            return res;
        }
    }
    @GetMapping(value = "/owners/{ownerId}/pets/{petId}/booking/{bookingId}/delete")
    public String deleteBooking(@PathVariable("bookingId") int bookingId,@PathVariable("ownerId") int ownerId, ModelAndView model) {
        bookingService.deleteBooking(bookingId);
        return "redirect:/owners/"+ ownerId ;
    }


}
