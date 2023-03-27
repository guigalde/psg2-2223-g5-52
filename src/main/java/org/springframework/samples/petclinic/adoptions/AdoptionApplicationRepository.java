package org.springframework.samples.petclinic.adoptions;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdoptionApplicationRepository extends CrudRepository<AdoptionApplication,Integer>{

    @Query("Select a from AdoptionApplication a where a.adoption.publishingOwner.id = :ownerId")
    public List<AdoptionApplication> findApplicationByPublishingOwnerId(@Param("ownerId") Integer ownerId);

    @Query("Select a from AdoptionApplication a where a.owner.id = :ownerId AND a.adoption.id = :adoptionId")
    public AdoptionApplication findExistingApplication(@Param("ownerId") Integer ownerId, @Param("adoptionId") Integer adoptionId);

    @Query("Select a from AdoptionApplication a where a.owner.id = :ownerId")
    public List<AdoptionApplication> findApplicationByOwnerId(@Param("ownerId") Integer ownerId);
}