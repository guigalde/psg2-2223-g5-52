package org.springframework.samples.petclinic.support;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportController {
    final String SHOW_SUPPORT_PAGE = "support/support-page";

    @GetMapping(value = "/support")
    public String getSupport() {
        return SHOW_SUPPORT_PAGE;
    }
}
