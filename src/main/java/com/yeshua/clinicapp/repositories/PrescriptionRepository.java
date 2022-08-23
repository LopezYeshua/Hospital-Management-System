package com.yeshua.clinicapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yeshua.clinicapp.models.Prescription;

@Repository
public interface PrescriptionRepository extends CrudRepository<Prescription, Long>{
	List<Prescription> findAll();
}
