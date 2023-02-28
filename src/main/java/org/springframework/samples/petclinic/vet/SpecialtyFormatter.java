package org.springframework.samples.petclinic.vet;

import java.text.ParseException;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

@Component
public class SpecialtyFormatter implements Formatter<Specialty>{

    private final VetService vetService;

    @Autowired
	public SpecialtyFormatter(VetService vetService) {
		this.vetService = vetService;
	}

    @Override
    public String print(Specialty specialty, Locale locale) {
        return ((Specialty) specialty).getName();
    }



    @Override
    public Specialty parse(String text, Locale locale) throws ParseException {
        Set<Specialty> findSpecialties = vetService.findSpecialties();
                for (Specialty specialty : findSpecialties) {
                    if (specialty.getName().equals(text)) {
                        return specialty;
                    }
                }
                throw new ParseException("type not found: " + text, 0);
    }

}