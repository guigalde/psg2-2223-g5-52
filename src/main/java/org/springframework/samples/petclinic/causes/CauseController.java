package org.springframework.samples.petclinic.causes;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CauseController {

    private CauseService causeService;

    private DonationService donationService;

    @Autowired
    public CauseController(CauseService causeService,  DonationService donationService) {
        this.causeService = causeService;
        this.donationService = donationService;
    }

    @GetMapping("/causes")
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

    @GetMapping("/causes/{causeId}/details")
    public ModelAndView causeDetails(@PathVariable("causeId") Integer causeId){
    
        ModelAndView view = new ModelAndView("causes/causeDetails");

        Cause causa = causeService.getCauseById(causeId);
        view.addObject("causa", causa);

        return view;

    
    }

    
}
