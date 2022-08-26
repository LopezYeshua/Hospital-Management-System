package com.yeshua.clinicapp.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.models.Prescription;
import com.yeshua.clinicapp.services.AppointmentServices;
import com.yeshua.clinicapp.services.DoctorServices;
import com.yeshua.clinicapp.services.PatientServices;
import com.yeshua.clinicapp.services.PrescriptionServices;
import com.yeshua.clinicapp.services.UserService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PatientServices patientService;
	
	@Autowired
	private AppointmentServices appointmentService;
	
	@Autowired
	private PrescriptionServices prescriptionService;
	
	@Autowired
	private DoctorServices doctorService;
	
	
	@RequestMapping("")
    public String doctorPage(Principal principal, Model model) {
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findUserByEmail(email));
        return "doctorPage.jsp";
    }
	
	@RequestMapping("/{id}")
	public String showAppointment(
			@ModelAttribute("prescription") Prescription prescription,
			Model model,
			@PathVariable("id") Long appointmentId,
			Principal principal) {
		String email = principal.getName();
		
		Doctor doctor = doctorService.findDoctor(userService.findUserByEmail(email).getDoctor().getId());
        model.addAttribute("doctor", doctor);
        model.addAttribute("appointmentId", appointmentId);
		model.addAttribute("patient", patientService.findPatient(appointmentService.findAppointment(appointmentId).getPatient().getId()));
		return "doctorAppointment.jsp";
	}
	
	@PostMapping("/{id}/prescription")
	public String addPrescription(
			@Valid @ModelAttribute("prescription") Prescription prescription, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "doctorAppointment.jsp";
		}
		appointmentService.deleteAppointment(id);
		prescriptionService.addPrescription(prescription);
		return "redirect:/home";
	}
}
