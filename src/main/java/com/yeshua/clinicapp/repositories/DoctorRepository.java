package com.yeshua.clinicapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yeshua.clinicapp.models.Doctor;

@Repository
public interface DoctorRepository extends CrudRepository<Doctor, Long>{
	List<Doctor> findAll();
}
