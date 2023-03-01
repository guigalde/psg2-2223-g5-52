package org.springframework.samples.petclinic.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
	public void saveBooking(Booking booking) throws DataAccessException {
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

}
