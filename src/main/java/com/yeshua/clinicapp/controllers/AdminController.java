package com.yeshua.clinicapp.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

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
	
//	Formats all dates and times passed into controller
	@InitBinder
	public void bindingPreparation(WebDataBinder binder) {
	  DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
	  CustomDateEditor startDateEditor = new CustomDateEditor(dateFormat1, true);
	  DateFormat timeFormat1 = new SimpleDateFormat("hh:mm");
	  CustomDateEditor endTimeEditor = new CustomDateEditor(timeFormat1, true);
	  DateFormat timeFormat2 = new SimpleDateFormat("hh:mm");
	  CustomDateEditor startTimeEditor = new CustomDateEditor(timeFormat2, true);
	  DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
	  CustomDateEditor birthdayEditor = new CustomDateEditor(dateFormat2, true);
	  
	  binder.registerCustomEditor(Date.class, "startDate", startDateEditor);
	  binder.registerCustomEditor(Date.class, "endTime", endTimeEditor);
	  binder.registerCustomEditor(Date.class, "startTime", startTimeEditor);
	  binder.registerCustomEditor(Date.class, "birthday", birthdayEditor);
	}
	
//	Admin Home Page
	@GetMapping("")
    public String adminPage(Principal principal, Model model,
    		@ModelAttribute("doctors") ArrayList<Doctor> doctors,
    		@ModelAttribute("admins") ArrayList<User> admins,
    		@ModelAttribute("patients") ArrayList<Patient> patients,
    		@ModelAttribute("allUsers") ArrayList<User> allUsers) {
		doctors.addAll((ArrayList<Doctor>) doctorService.allDoctors());
		admins.addAll((ArrayList<User>) userService.allAdmins());
		patients.addAll((ArrayList<Patient>) patientService.allPatients());
		allUsers.addAll((ArrayList<User>) userService.allUsers());
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findUserByEmail(email));
        return "adminPage.jsp";
    }
	
	@RequestMapping("/registerPatient")
	public String registerPatient(
			@ModelAttribute("user") User user,
			Model model) {
		int isAdmin = 1;
		model.addAttribute("isAdmin", isAdmin);
		return "registrationPage.jsp";
	}
	
//	Admin appointment controllers
	@RequestMapping("/{id}/appointments")
	@PreAuthorize("hasRole('ADMIN')")
	public String newAppointment(
			@ModelAttribute("appointment") Appointment appointment,
			@PathVariable("id") Long id,
			Model model) {
		model.addAttribute("patient", userService.findUser(id));
		ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
		allDoctors.addAll(doctorService.allDoctors());
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
	
	@GetMapping("/{id}/editAppointment")
	public String editAppointment(
			@PathVariable("id") Long id,
			Model model) {
		Appointment appointment = appointementService.findAppointment(id);
		model.addAttribute("appointment", appointment);
		List<Doctor> allDoctors = doctorService.allDoctors();
		model.addAttribute("patient", patientService.findPatient(appointment.getPatient().getId()));
		model.addAttribute("doctors", allDoctors);
		return "editAppointment.jsp";
	}
	
	@PutMapping("/{id}/updateAppointment")
	public String updateAppointment(
			@RequestParam("doctorId") Long doctorId,
			@PathVariable("id") Long id,
			@Valid @ModelAttribute("appointment") Appointment appointment, BindingResult result) {
		if (result.hasErrors()) return "editAppointment.jsp";
		appointementService.addAppointment(appointment);
		return "redirect:/admin/" +  doctorId + "/showAppointments";
	}
	
	@DeleteMapping("/{id}/deleteAppointment")
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteAppointment(@PathVariable("id") Long id,
			@RequestParam("userId") Long userId) {
		appointementService.deleteAppointment(id);
		return "redirect:/admin/" + userId + "/showAppointments";
	}

	
	//	End of admin appointments
	
	@RequestMapping("/{id}/showUser")
	@PreAuthorize("hasRole('ADMIN')")
	public String showUser(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findUser(id));
		return "showUser.jsp";
	}
	
	
	@GetMapping("/{id}/edit")
	public String editUser(@PathVariable("id") Long id,
			Model model,
			@ModelAttribute("doctor") Doctor doctor,
			@ModelAttribute("patient") Patient patient) {
		model.addAttribute("user", userService.findUser(id));
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
