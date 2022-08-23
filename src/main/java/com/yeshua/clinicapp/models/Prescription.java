package com.yeshua.clinicapp.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="prescriptions")
public class Prescription {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "doctor_id")
	private Doctor doctor;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "patient_id")
	private Patient patient;
	
	@OneToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name="appointment_id", referencedColumnName = "id")
	private Appointment appointment;
	
	@Size(min=3)
	private String medication;
	
	@Size(min=3)
	private String description;
	
	@Size(min=3)
	private String timesTaken;
	
	@Size(min=3)
	private String daysTaken;
	
	private Long isArchived;
	
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	public Prescription() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public String getMedication() {
		return medication;
	}

	public void setMedication(String medication) {
		this.medication = medication;
	}

	public String getTimesTaken() {
		return timesTaken;
	}

	public void setTimesTaken(String timesTaken) {
		this.timesTaken = timesTaken;
	}

	public String getDaysTaken() {
		return daysTaken;
	}

	public void setDaysTaken(String daysTaken) {
		this.daysTaken = daysTaken;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getIsArchived() {
		return isArchived;
	}

	public void setIsArchived(Long isArchived) {
		this.isArchived = isArchived;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Appointment getAppointment() {
		return appointment;
	}

	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}


	
}
