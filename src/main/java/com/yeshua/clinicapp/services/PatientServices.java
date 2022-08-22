package com.yeshua.clinicapp.services;

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
}
