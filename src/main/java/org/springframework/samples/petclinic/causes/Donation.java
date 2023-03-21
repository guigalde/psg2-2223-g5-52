package org.springframework.samples.petclinic.causes;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.samples.petclinic.owner.Owner;

import lombok.Getter;
import lombok.Setter;

//details of each donation (date of donation, amount, and client).

@Entity
@Getter
@Setter
public class Donation {

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private LocalDate dateOfDonation;

    private Double budget;

    @ManyToOne
    private Owner owner;

    @ManyToOne
    private Cause cause;


}
