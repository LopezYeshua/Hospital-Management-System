package com.yeshua.clinicapp.controllers;

import java.security.Principal;
import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeshua.clinicapp.models.Appointment;
import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.models.User;
import com.yeshua.clinicapp.services.DoctorServices;
import com.yeshua.clinicapp.services.UserService;
import com.yeshua.clinicapp.validator.UserValidator;

@Controller
public class HomeController {
    
	@Autowired
	UserService userService;
	@Autowired
	UserValidator userValidator;
	@Autowired
	DoctorServices doctorService;
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/covid")
	public String covid(
			@ModelAttribute("appointment") Appointment appointment,
			Model model) {
		model.addAttribute("doctors", doctorService.allDoctors());
		return "covidAppointment.jsp";
	}
    
    @RequestMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user,
    		Model model) {
    	int isAdmin = 0;
    	model.addAttribute("isAdmin", isAdmin);
        return "registrationPage.jsp";
    }
    
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result,
    		Model model,
    		@RequestParam("role") Long role) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        if (role == 1) userService.saveUserWithDoctorRole(user);
        if (role == 2) userService.saveUserWithAdminRole(user);
        if (role == 0) userService.saveUserWithPatientRole(user);
        return "redirect:/home";
    }
    
    @RequestMapping(value = {"/home"})
    public String home(Principal principal, Model model) {
        String email = principal.getName();
        User user = userService.findUserByEmail(email);
        if (user.getRoles().get(0).getName().contains("ROLE_ADMIN")) return "redirect:/admin";
        if (user.getRoles().get(0).getName().contains("ROLE_DOCTOR")) return "redirect:/doctor";
        else return "redirect:/patient";
    }
    
    @RequestMapping("/doctors")
    public String allDoctors(@ModelAttribute("allDoctors") ArrayList<Doctor> allDoctors, Model model) {
    	model.addAttribute("allDoctors", allDoctors);
    	allDoctors.addAll(doctorService.allDoctors());
    	return "ourDoctors.jsp";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
}
