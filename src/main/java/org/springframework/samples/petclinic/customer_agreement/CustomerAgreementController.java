package org.springframework.samples.petclinic.customer_agreement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerAgreementController {
    
    final String SHOW_CUSTOMER_AGREEMENT = "customer_agreement/customer-agreement";
    @GetMapping("/customer-agreement")
    public ModelAndView showCustomerAgreement() {
        return new ModelAndView(SHOW_CUSTOMER_AGREEMENT);
    }

}
