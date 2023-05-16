package org.springframework.samples.petclinic.clinics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClinicController {
    final String LIST_CLINICS = "clinics";
    final String SHOW_CLINIC = "clinic";

    @GetMapping("/clinics")
    public ModelAndView showCustomerAgreement() {
        return new ModelAndView(LIST_CLINICS);
    }

    @GetMapping("/clinic/id")
    public ModelAndView showClinic(){
        return new ModelAndView(SHOW_CLINIC);
    }
}
