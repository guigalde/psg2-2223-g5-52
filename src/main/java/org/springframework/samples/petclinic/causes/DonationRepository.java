package org.springframework.samples.petclinic.causes;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

@Repository
public interface DonationRepository extends CrudRepository<Donation,Integer>{

    @Query("SELECT donation FROM Donation donation WHERE donation.cause.id = :id")
    public List<Donation> findDonationCauseById(@Param("id") Integer id);
    
}
