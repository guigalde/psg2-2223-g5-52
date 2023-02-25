package org.springframework.samples.petclinic.vet;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.text.ParseException;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;


@ExtendWith(MockitoExtension.class)
public class SpecialtyFormatterTests {

	@Mock
	private VetService clinicService;

	private SpecialtyFormatter specialtyFormatter;

	@BeforeEach
	void setup() {
		specialtyFormatter = new SpecialtyFormatter(clinicService);
	}

    @Test
    void shouldParse() throws ParseException {
        Mockito.when(clinicService.findSpecialties()).thenReturn(makeSpecialties());
        Specialty specialty = specialtyFormatter.parse("Dentist", Locale.ENGLISH);
        assertEquals("Dentist", specialty.getName());
    }

    @Test
    void shouldPrint() throws ParseException {
        Mockito.when(clinicService.findSpecialties()).thenReturn(makeSpecialties());
        Specialty specialty = specialtyFormatter.parse("Orthodontist", Locale.ENGLISH);
        String specialtyName = specialtyFormatter.print(specialty, Locale.ENGLISH);
        assertEquals("Orthodontist", specialtyName);
    }

    private Set<Specialty> makeSpecialties() {
        Set<Specialty> specialties = new HashSet<>();
        Specialty specialty1 = new Specialty();
        specialty1.setName("Dentist");
        specialties.add(specialty1);
        Specialty specialty2 = new Specialty();
        specialty2.setName("Orthodontist");
        specialties.add(specialty2);
        return specialties;
    }

}


