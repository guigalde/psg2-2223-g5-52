package org.springframework.samples.petclinic.booking;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.samples.petclinic.model.BaseEntity;
import org.springframework.samples.petclinic.pet.Pet;
import org.springframework.samples.petclinic.owner.Owner;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Booking extends BaseEntity {

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private LocalDate startDate;
    
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private LocalDate finishDate;
    
    @OneToOne
    private Pet pet;

    @ManyToOne
    private Owner owner;
    
}