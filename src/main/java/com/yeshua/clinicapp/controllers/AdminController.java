package com.yeshua.clinicapp.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.clinicapp.models.Appointment;
import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.models.Patient;
import com.yeshua.clinicapp.models.User;
import com.yeshua.clinicapp.services.AppointmentServices;
import com.yeshua.clinicapp.services.DoctorServices;
import com.yeshua.clinicapp.services.PatientServices;
import com.yeshua.clinicapp.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DoctorServices doctorService;
	
	@Autowired
	private PatientServices patientService;
	
	@Autowired
	private AppointmentServices appointementService;
	
//	Formats all dates passed into controller
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
//	Admin Home Page
	@GetMapping("")
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
	
//	Admin appointment controllers
	@RequestMapping("/{id}/appointments")
	@PreAuthorize("hasRole('ADMIN')")
	public String newAppointment(
			@ModelAttribute("appointment") Appointment appointment,
			@PathVariable("id") Long id,
			Model model) {
		model.addAttribute("patient", userService.findUser(id));
		ArrayList<User> allDoctors = new ArrayList<User>();
		allDoctors.addAll(userService.allDoctors());
		model.addAttribute("doctors", allDoctors);
		return "appointments.jsp";
	}
	
	@PostMapping("/{id}/appointments")
	@PreAuthorize("hasRole('ADMIN')")
	public String createAppointment(@Valid @ModelAttribute("appointment") Appointment appointment, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "appointment.jsp";
		}
		appointementService.addAppointment(appointment);
		return "redirect:/";
	}
	
	@GetMapping("/{id}/showAppointments")
	@PreAuthorize("hasRole('ADMIN')")
	public String showAppointments(@PathVariable("id") Long id,
			Model model) {
		model.addAttribute("user", userService.findUser(id));
		return "showAppointments.jsp";
	}
	
//	End of admin appointments
	
	@RequestMapping("/{id}/showUser")
	@PreAuthorize("hasRole('ADMIN')")
	public String showUser(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findUser(id));
		return "showUser.jsp";
	}
	
	
	@GetMapping("/{id}/edit")
	@PreAuthorize("hasRole('ADMIN')")
	public String editUser(@PathVariable("id") Long id,
			Model model,
			@ModelAttribute("doctor") Doctor doctor,
			@ModelAttribute("patient") Patient patient) {
		model.addAttribute("user", userService.findUser(id));
		model.addAttribute("doctor", new Doctor());
		return "editUser.jsp";
	}
	
	@PostMapping("/{id}/addDoctor")
	@PreAuthorize("hasRole('ADMIN')")
	public String createDoctor(
			@PathVariable("id") Long id,
			@ModelAttribute("user") User user,
			@Valid @ModelAttribute("doctor") Doctor doctor, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "editUser.jsp";
		}
		System.out.println("success");
		doctorService.addDoctor(doctor);
		return "redirect:/admin/"+ id + "/edit";
	}
	
	@PostMapping("/{id}/addPatient")
	@PreAuthorize("hasRole('ADMIN')")
	public String createPatient(
			@PathVariable("id") Long id,
			@ModelAttribute("user") User user,
			@Valid @ModelAttribute("patient") Patient patient, BindingResult result) {
		if (result.hasErrors()) {
			return "editUser.jsp";
		}
		System.out.println("success");
		patientService.addPatient(patient);
		return "redirect:/admin/"+ id + "/edit";
	}
	
	@PutMapping("/{id}/edit")
	@PreAuthorize("hasRole('ADMIN')")
	public String updateUser(
			@Valid @ModelAttribute("user") User user, BindingResult result,
			@PathVariable("id") Long id,
			Model model) {
		if (result.hasErrors()) {
			return "editUser.jsp";
		}
		userService.updateUser(user);
		return "redirect:/admin/"+ id + "/showUser";
	}
	

	@DeleteMapping("/{id}/delete")
	@PreAuthorize("hasRole('ADMIN')")
	public String destroyUser(@PathVariable("id") Long id) {
		userService.deleteUser(id);
		return "redirect:/admin";
	}
	
	
}
