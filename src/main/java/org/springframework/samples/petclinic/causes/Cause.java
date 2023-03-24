package org.springframework.samples.petclinic.causes;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

import org.springframework.samples.petclinic.model.BaseEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Cause extends BaseEntity{

    @NotEmpty
    private String name;

    @NotEmpty
    private String description;

    @Positive
    private Double budgetTarget;

    @NotEmpty
    private String organizationInCharge;

    @OneToMany(cascade = CascadeType.ALL, mappedBy="cause")
    private List<Donation> donations;




    
}
