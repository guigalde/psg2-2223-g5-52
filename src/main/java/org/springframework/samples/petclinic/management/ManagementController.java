package org.springframework.samples.petclinic.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class ManagementController {
    @GetMapping(value = "/management")
    public String showCustomerAgreement(Map<String, Object> model) {
        return "management/CustomerAgreementDocument";
    }
}
