package org.springframework.samples.petclinic.causes;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DonationController {

    private DonationService donationService;

    private String CREATE_DONATION_FORM = "donations/createDonationForm";

    @Autowired
    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }

    @Transactional(readOnly = true)
    @GetMapping(value = "/causes/{causeId}/donation/new")
    public ModelAndView initCreateDonationForm(@PathVariable("causeId") int causeId) {
        ModelAndView res = new ModelAndView(CREATE_DONATION_FORM);
        LocalDate dateDonation = LocalDate.now();
        res.addObject("dateOfDonation", dateDonation);
        return res;
    }


    @Transactional
    @PostMapping("/causes/{causeId}/donation/new")
    public ModelAndView saveDonation(@Valid Donation donation, BindingResult br, RedirectAttributes attributes){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView(CREATE_DONATION_FORM, br.getModel());
            return res;
        }else{
            donationService.saveDonation(donation);
            res = new ModelAndView("redirect:/causes/{causeId}");
            attributes.addFlashAttribute("message", "The donation was created successfully");
            return res;
        }
    }

    @GetMapping("/donations/{causeId}")
    public ModelAndView listDonationsByCauseId(@PathVariable("causeId") int causeId){
        List<Donation> listDonations = donationService.getCauseDonationsById(causeId);
        ModelAndView view = new ModelAndView("donationss/listDonationsByCauseId");
        view.addObject("donationsCauseId", listDonations);
        return view;
    }
    
}
