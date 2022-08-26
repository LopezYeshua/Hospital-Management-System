package com.yeshua.clinicapp.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.models.Patient;
import com.yeshua.clinicapp.models.Prescription;
import com.yeshua.clinicapp.models.User;
import com.yeshua.clinicapp.services.PatientServices;
import com.yeshua.clinicapp.services.PrescriptionServices;
import com.yeshua.clinicapp.services.UserService;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PatientServices patientService;
	@Autowired
	private PrescriptionServices prescriptionService;

	@RequestMapping("")
    public String patientPage(
    		Principal principal,
    		Model model) {
        String email = principal.getName();
        User currentUser = userService.findUserByEmail(email);
        model.addAttribute("currentUser", currentUser);
        List<Prescription> allPrescriptions = prescriptionService.allPrescriptions(); 
        model.addAttribute("allPrescriptions", allPrescriptions);
        return "patientPage.jsp";
    }
	
	@GetMapping("/{id}/edit")
	public String editUser(@PathVariable("id") Long id,
			Model model,
			@ModelAttribute("doctor") Doctor doctor,
			@ModelAttribute("patient") Patient patient) {
		model.addAttribute("user", userService.findUser(id));
		return "editUser.jsp";
	}
	
	@PostMapping("/{id}/addPatient")
	public String createPatient(
			@PathVariable("id") Long id,
			@ModelAttribute("user") User user,
			@Valid @ModelAttribute("patient") Patient patient, BindingResult result) {
		if (result.hasErrors()) {
			return "editUser.jsp";
		}
		System.out.println("success");
		patientService.addPatient(patient);
		return "redirect:/patient/"+ id + "/edit";
	}
	
	@PutMapping("/{id}/edit")
	public String updateUser(
			@Valid @ModelAttribute("user") User user, BindingResult result,
			@PathVariable("id") Long id,
			Model model) {
		if (result.hasErrors()) {
			return "editUser.jsp";
		}
		userService.updateUser(user);
		return "redirect:/patient";
	}
}
