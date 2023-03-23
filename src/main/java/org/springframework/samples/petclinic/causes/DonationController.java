package org.springframework.samples.petclinic.causes;

import java.time.LocalDate;
import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.owner.OwnerService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DonationController {

    private DonationService donationService;

    private CauseService causeService;

    private OwnerService ownerService;

    private String CREATE_DONATION_FORM = "donations/createDonationForm";

    @Autowired
    public DonationController(DonationService donationService, OwnerService ownerService, CauseService causeService) {
        this.donationService = donationService;
        this.ownerService = ownerService;
        this.causeService = causeService;
    }

    @Transactional(readOnly = true)
    @GetMapping(value = "/cause/{causeId}/donation/new")
    public ModelAndView initCreateDonationForm(@PathVariable("causeId") int causeId) {
        ModelAndView res = new ModelAndView(CREATE_DONATION_FORM);
        Donation donacion = new Donation();
        res.addObject("listOwners", ownerService.findAllOwners() );
        res.addObject("donation", donacion);
        return res;
    }


    @Transactional
    @PostMapping("/cause/{causeId}/donation/new")
    public ModelAndView saveDonation(@Valid Donation donation, @PathVariable("causeId") int causeId, BindingResult br, RedirectAttributes attributes){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView(CREATE_DONATION_FORM, br.getModel());
            return res;
        }else{     
            donation.setDateOfDonation(LocalDate.now());
            donation.setCause(causeService.getCauseById(causeId));
            donationService.saveDonation(donation);

            attributes.addFlashAttribute("message", "La donacion fue creada con exito");
            res= new ModelAndView("redirect:/cause/"+causeId+"/details");
            return res;
        }
    }
}
