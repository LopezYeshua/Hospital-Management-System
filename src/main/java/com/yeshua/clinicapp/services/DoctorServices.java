package com.yeshua.clinicapp.services;

import java.util.List;
import java.util.Optional;

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
	
	public List<Doctor> allDoctors() {
		return doctorRepository.findAll();
	}

	public Doctor findDoctor(Long id) {
		Optional<Doctor> optionalDoctor = doctorRepository.findById(id);
		if (optionalDoctor.isPresent()) return optionalDoctor.get();
		return null;
	}
}
