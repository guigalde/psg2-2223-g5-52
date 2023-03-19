package org.springframework.samples.petclinic.adoptions;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdoptionRepository extends CrudRepository<Adoption,Integer>{
    
    @Query("SELECT a FROM Adoption a WHERE a.accepted = false")
    public List<Adoption> findAll();

    @Query("SELECT a FROM Adoption a WHERE a.publishingOwner.id = :ownerId AND a.pet.id = :petId AND a.accepted = false")
    public Adoption findPendingAdoptionById(@Param("ownerId") Integer ownerId, @Param("petId") Integer petId);
}