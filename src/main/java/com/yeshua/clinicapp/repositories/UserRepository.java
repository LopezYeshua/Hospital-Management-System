package com.yeshua.clinicapp.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.yeshua.clinicapp.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	Optional<User> findById(Long id);
	List<User> findAll();
	
	Optional<User> findByEmail(String email);
}
