package org.springframework.samples.petclinic.causes;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CauseController {

    private CauseService causeService;

    private DonationService donationService;

    @Autowired
    public CauseController(CauseService causeService,  DonationService donationService) {
        this.causeService = causeService;
        this.donationService = donationService;
    }
    @Transactional
    @GetMapping("/cause")
    public ModelAndView listCauses(){
        List<Cause> listCauses = causeService.getAllCauses();
        ModelAndView view = new ModelAndView("causes/listCauses");
        Map<Cause,Double> budgetPerCause = new HashMap<>();

        for(Cause c: listCauses){
            budgetPerCause.put(c, c.getDonations().stream().mapToDouble(s->s.getBudget()).sum());
        }

        view.addObject("budgetPerCause", budgetPerCause);
        view.addObject("listCauses", listCauses);
        return view;
    }
    @Transactional
    @GetMapping("/cause/{causeId}/details")
    public ModelAndView causeDetails(@PathVariable("causeId") Integer causeId){
    
        ModelAndView view = new ModelAndView("causes/causeDetails");

        Cause causa = causeService.getCauseById(causeId);
        List<Donation> donations = donationService.getCauseDonationsById(causeId);
        Double totalAchieved = donations.stream().mapToDouble(c->c.getBudget()).sum();
        view.addObject("cause", causa);
        view.addObject("donoList", donations);
        view.addObject("total", totalAchieved);

        return view;

    
    }

    @Transactional(readOnly = true)
    @GetMapping(value = "/cause/new")
    public ModelAndView initCreateCauseForm() {
        ModelAndView res = new ModelAndView("causes/createCauseForm");
        Cause cause  = new Cause();
     
        res.addObject("cause", cause);
        return res;
    }

    @Transactional
    @PostMapping("/cause/new")
    public ModelAndView saveCause(@Valid Cause cause, BindingResult br, RedirectAttributes attributes){
        ModelAndView res = new ModelAndView();
        if(br.hasErrors()){
            res= new ModelAndView("causes/createCauseForm", br.getModel());
            return res;
        }else{          
            causeService.saveCause(cause);

            attributes.addFlashAttribute("message", "Causa creada con exito");
            res= new ModelAndView("redirect:/cause");
            return res;
        }
    }

    
}
