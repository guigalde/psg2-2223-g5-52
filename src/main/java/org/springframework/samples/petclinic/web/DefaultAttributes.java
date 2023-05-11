package org.springframework.samples.petclinic.web;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.user.PricingPlan;
import org.springframework.samples.petclinic.user.User;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class DefaultAttributes {
    @Autowired
    UserService userService;

    @ModelAttribute("currentUserPlan")
    public PricingPlan getCurrentUser(Principal principal){
        PricingPlan plan=null;
        User user = userService.currentUser(principal);
        if(user!=null)
        plan = user.getPlan();

        return plan;
        
    }
    
}
