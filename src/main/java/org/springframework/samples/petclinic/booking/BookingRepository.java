package org.springframework.samples.petclinic.booking;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer>{
    
    @Query("SELECT booking FROM Booking booking WHERE booking.owner.id = :id")
    public List<Booking> findOwnerBookingsById(@Param("id") Integer id);

    @Query("SELECT booking FROM Booking booking WHERE booking.pet.id = :id")
    public List<Booking> findPetBookingsById(@Param("id") Integer id);
}
