package com.yeshua.clinicapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeshua.clinicapp.models.Prescription;
import com.yeshua.clinicapp.repositories.PrescriptionRepository;

@Service
public class PrescriptionServices {
	
	@Autowired
	private PrescriptionRepository prescriptionRepository;
	
	public List<Prescription> allPrescriptions() {
		return prescriptionRepository.findAll();
	}
	
	public Prescription addPrescription(Prescription p) {
		return prescriptionRepository.save(p);
	}
	
	public void deletePrescription(Long id) {
    	prescriptionRepository.deleteById(id);
    }
	
	public Prescription findPrescription(Long id) {
		Optional<Prescription> optionalPrescription = prescriptionRepository.findById(id);
		if (optionalPrescription.isPresent()) return optionalPrescription.get();
		return null;
	}
}
