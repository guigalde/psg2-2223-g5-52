package org.springframework.samples.petclinic.booking;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.booking.exceptions.ConcurrentBookingsForPet;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BookingService {

    private BookingRepository bookingRepository;

    @Autowired
    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    @Transactional
	public void saveBooking(Booking booking) throws DataAccessException, ConcurrentBookingsForPet {
        concurringBookingSamePet(booking);
		bookingRepository.save(booking);
	}

    @Transactional(readOnly = true)
    public List<Booking> getOwnerBookingsById(Integer ownerId) {
        return bookingRepository.findOwnerBookingsById(ownerId);
    }

    @Transactional
    public void deleteBooking(Booking booking) throws DataAccessException {
        bookingRepository.delete(booking);
    }

    @Transactional
    public void deleteBooking(Integer id) throws DataAccessException {
        bookingRepository.deleteById(id);
    }

    public void concurringBookingSamePet(Booking booking) throws ConcurrentBookingsForPet{
        LocalDate startDate= booking.getStartDate();
        LocalDate finishDate = booking.getFinishDate();
        List<Booking> bookingsOfPet=bookingRepository.findPetBookingsById(booking.getPet().getId());
        for(Booking bk:bookingsOfPet){
            if(startDate.isAfter(bk.getStartDate()) && startDate.isBefore(bk.getFinishDate())){
                throw new ConcurrentBookingsForPet();
            }else if(finishDate.isAfter(bk.getStartDate()) && finishDate.isBefore(bk.getFinishDate())){
                throw new ConcurrentBookingsForPet();
            }else if(startDate.isBefore(bk.getStartDate())&&finishDate.isAfter(bk.getFinishDate())){
                throw new ConcurrentBookingsForPet();
            }
        }
    }

}
