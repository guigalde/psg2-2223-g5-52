package org.springframework.samples.petclinic.adoptions;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.springframework.samples.petclinic.model.BaseEntity;
import org.springframework.samples.petclinic.owner.Owner;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class AdoptionApplication extends BaseEntity{
    
    @NotBlank
    @Length(max=200)
    protected String description;
    
    @ManyToOne
    protected Adoption adoption;

    @OneToOne
    protected Owner owner;
    
}
