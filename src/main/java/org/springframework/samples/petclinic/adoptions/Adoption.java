package org.springframework.samples.petclinic.adoptions;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.samples.petclinic.model.BaseEntity;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.pet.Pet;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Adoption extends BaseEntity {

    @OneToOne
    @NotNull
    protected Owner publishingOwner;
    
    @OneToOne
    @NotNull
    protected Pet pet;

    @NotBlank
    @Length(max=100)
    protected String description;
    
    protected Boolean accepted;
}