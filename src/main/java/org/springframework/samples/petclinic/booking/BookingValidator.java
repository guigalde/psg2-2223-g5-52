package org.springframework.samples.petclinic.booking;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class BookingValidator implements Validator{

    private static final String BADDATE = "badDate";

    @Override
	public void validate(Object obj, Errors errors) {
		Booking bk = (Booking) obj;

		if (!bk.getFinishDate().isAfter(bk.getStartDate())) {
			errors.rejectValue("finishDate", BADDATE, BADDATE);
		}
	}

    @Override
	public boolean supports(Class<?> clazz) {
		return Booking.class.isAssignableFrom(clazz);
	}

}
