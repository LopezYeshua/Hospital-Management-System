package com.yeshua.clinicapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yeshua.clinicapp.models.Patient;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long>{
	List<Patient> findAll();

}
