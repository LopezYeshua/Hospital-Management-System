package com.yeshua.clinicapp.controllers;

import java.security.Principal;
import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.models.Patient;
import com.yeshua.clinicapp.models.User;
import com.yeshua.clinicapp.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("")
    public String adminPage(Principal principal, Model model,
    		@ModelAttribute("doctors") ArrayList<User> doctors,
    		@ModelAttribute("admins") ArrayList<User> admins,
    		@ModelAttribute("patients") ArrayList<User> patients) {
		doctors.addAll((ArrayList<User>) userService.allDoctors());
		admins.addAll((ArrayList<User>) userService.allAdmins());
		patients.addAll((ArrayList<User>) userService.allPatients());
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(email));
        return "adminPage.jsp";
    }
	
	@RequestMapping("/{id}/showUser")
	public String showUser(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findUser(id));
		return "showUser.jsp";
	}
	
	@RequestMapping("/{id}/edit")
	public String editUser(@PathVariable("id") Long id,
			Model model,
			@ModelAttribute("doctor") Doctor doctor,
			@ModelAttribute("patient") Patient patient) {
		model.addAttribute("user", userService.findUser(id));
		return "editUser.jsp";
	}
	
	@PutMapping("/{id}/edit")
	public String updateUser(
			@Valid @ModelAttribute("user") User user, BindingResult result,
			@PathVariable("id") Long id,
			Model model) {
		if (result.hasErrors()) {
			System.out.println("has errors");
			return "editUser.jsp";
		}
		userService.updateUser(user);
		return "redirect:/admin/"+ id + "/showUser";
	}
	
	@DeleteMapping("/{id}/delete")
	public String destroyUser(@PathVariable("id") Long id) {
		userService.deleteUser(id);
		return "redirect:/admin";
	}
	
	
}
