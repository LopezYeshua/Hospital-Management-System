package com.yeshua.clinicapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeshua.clinicapp.models.Patient;
import com.yeshua.clinicapp.repositories.PatientRepository;

@Service
public class PatientServices {
	
	@Autowired
	private PatientRepository patientRepository;
	
	public Patient addPatient(Patient patient) {
		return patientRepository.save(patient);
	}
	
	public List<Patient> allPatients() {
		return patientRepository.findAll();
	}
	
	public Patient findPatient(Long id) {
		Optional<Patient> optionalPatient = patientRepository.findById(id);
		if (optionalPatient.isPresent()) return optionalPatient.get();
		return null;
	}
}
