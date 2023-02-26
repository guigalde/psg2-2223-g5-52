package org.springframework.samples.petclinic.booking;

import java.time.LocalDate;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class BookingValidator implements Validator{

    private static final String BADDATE = "badDate";
	private static final String NULLDATE = "nullDate";
	private static final String PASTDATE = "pastDate";
	//Los ifs anidados son para que aunque haya valores null se muestren todos los errores, si se pusieran fuera, las comparaciones darían errores si los valores son null
    @Override
	public void validate(Object obj, Errors errors) {
		Booking bk = (Booking) obj;
		if(bk.getStartDate()==null){
			errors.rejectValue("startDate", NULLDATE, NULLDATE);
			if(!bk.getFinishDate().isAfter(LocalDate.now()) && !(bk.getFinishDate()==null)){
				errors.rejectValue("finishDate", PASTDATE, PASTDATE);
			}
		}
		if(bk.getFinishDate()==null){
			errors.rejectValue("finishDate", NULLDATE, NULLDATE);
			if(!bk.getStartDate().isAfter(LocalDate.now())&& !(bk.getStartDate()==null)){
				errors.rejectValue("startDate", PASTDATE, PASTDATE);
			}
		}
		if(!(bk.getFinishDate()==null || bk.getStartDate()==null)){
			if(!bk.getStartDate().isAfter(LocalDate.now())){
				errors.rejectValue("startDate", PASTDATE, PASTDATE);
			}
			if(!bk.getFinishDate().isAfter(LocalDate.now())){
				errors.rejectValue("finishDate", PASTDATE, PASTDATE);
			}
			if (!bk.getFinishDate().isAfter(bk.getStartDate())) {
				errors.rejectValue("finishDate", BADDATE, BADDATE);
			}
		}
			
		
	}

    @Override
	public boolean supports(Class<?> clazz) {
		return Booking.class.isAssignableFrom(clazz);
	}

}
