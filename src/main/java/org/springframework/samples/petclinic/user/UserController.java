/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.user;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.owner.OwnerService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Juergen Hoeller
 * @author Ken Krebs
 * @author Arjen Poutsma
 * @author Michael Isvy
 */
@Controller
public class UserController {

	private static final String VIEWS_OWNER_CREATE_FORM = "users/createOwnerForm";
	private static final String UPDATE_PLAN_FORM = "users/updatePlanForm";
	private static final String PROFILE_VIEW = "users/userProfile";
	private final OwnerService ownerService;
	private final UserService userService;

	@Autowired
	public UserController(OwnerService clinicService,  UserService userService) {
		this.ownerService = clinicService;
		this.userService = userService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping(value = "/users/new")
	public String initCreationForm(Map<String, Object> model) {
		Owner owner = new Owner();
		model.put("owner", owner);
		return VIEWS_OWNER_CREATE_FORM;
	}

	@PostMapping(value = "/users/new")
	public String processCreationForm(@Valid Owner owner, BindingResult result) {
		if (result.hasErrors()) {
			return VIEWS_OWNER_CREATE_FORM;
		}
		else {
			//creating owner, user, and authority
			owner.getUser().setPlan(PricingPlan.BASIC);
			this.ownerService.saveOwner(owner);
			owner.getUser().setPlan(PricingPlan.BASIC);
			return "redirect:/";
		}
	}

	@GetMapping(value = "/users/plan")
	public String getUpdatePlanForm(Map<String, Object> model) {
		List<PricingPlan> plans = List.of(PricingPlan.BASIC,PricingPlan.ADVANCED,PricingPlan.PRO);
		Optional<User> loggedUser = userService.getLoggedUser();
		model.put("loggedUser", loggedUser.get());
		model.put("plans", plans);
		return UPDATE_PLAN_FORM;
	}

	@PostMapping(value="/users/plan")
	public ModelAndView processUpdatePlanForm(@Valid User user, BindingResult br) {
		if(br.hasErrors()) {
			ModelAndView model = new ModelAndView(UPDATE_PLAN_FORM, br.getModel());
			List<PricingPlan> plans = List.of(PricingPlan.BASIC,PricingPlan.ADVANCED,PricingPlan.PRO);
			Optional<User> loggedUser = userService.getLoggedUser();
			model.addObject("loggedUser", loggedUser.get());
			model.addObject("plans", plans);
			return model;
		} else {
			User loggedUser = userService.getLoggedUser().get();
			loggedUser.setPlan(user.getPlan());
			this.userService.saveUser(loggedUser);
			return new ModelAndView("redirect:/");
		}
	}

	@GetMapping(value = "/users/profile")
	public String getUserProfile(Map<String, Object> model) {
		List<PricingPlan> plans = List.of(PricingPlan.BASIC,PricingPlan.ADVANCED,PricingPlan.PRO);
		Optional<User> optUser = userService.getLoggedUser();
		User loggedUser = optUser.get();
		Owner loggedOwner = ownerService.findOwnerByUsername(loggedUser.getUsername());
		model.put("loggedUser", loggedUser);
		model.put("loggedOwner", loggedOwner);
		model.put("plans", plans);
		return PROFILE_VIEW;
	}

}
