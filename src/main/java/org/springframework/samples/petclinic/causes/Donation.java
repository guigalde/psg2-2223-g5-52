package org.springframework.samples.petclinic.causes;

import java.time.LocalDate;

import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

import ch.qos.logback.core.net.server.Client;
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

    private Client client;


}
