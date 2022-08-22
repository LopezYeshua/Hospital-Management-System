package com.yeshua.clinicapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yeshua.clinicapp.models.Appointment;

@Repository
public interface AppointmentRepository extends CrudRepository<Appointment, Long>{
	List<Appointment> findAll();
}
