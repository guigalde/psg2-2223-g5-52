package org.springframework.samples.petclinic.causes;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class CauseController {

    private CauseService causeService;

    //private DonationService donationService;

    @Autowired
    public CauseController(CauseService causeService) {
        this.causeService = causeService;
        // ,  DonationService donationService) this.donationService = donationService;
    }

    
}
