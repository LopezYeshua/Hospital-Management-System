package com.yeshua.clinicapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeshua.clinicapp.models.Appointment;
import com.yeshua.clinicapp.repositories.AppointmentRepository;

@Service
public class AppointmentServices {
	
	@Autowired
	private AppointmentRepository appointmentRepository;
	
	public Appointment addAppointment(Appointment a) {
		return appointmentRepository.save(a);
	}

}
