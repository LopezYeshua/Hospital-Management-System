package com.yeshua.clinicapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeshua.clinicapp.models.Doctor;
import com.yeshua.clinicapp.repositories.DoctorRepository;

@Service
public class DoctorServices {
	
	@Autowired
	private DoctorRepository doctorRepository;
	
	public Doctor addDoctor(Doctor doctor) {
		return doctorRepository.save(doctor);
	}
}
