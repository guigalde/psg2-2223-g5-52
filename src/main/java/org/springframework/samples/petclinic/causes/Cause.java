package org.springframework.samples.petclinic.causes;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import org.springframework.samples.petclinic.model.BaseEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Cause extends BaseEntity{

    private String description;

    private Double budgetTarget;

    private String organizationInCharge;

    @OneToMany(cascade = CascadeType.ALL, mappedBy="cause")
    private List<Donation> donations;




    
}
