/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.pet;

import java.time.LocalDate;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.pet.exceptions.DuplicatedPetNameException;
import org.springframework.samples.petclinic.user.PricingPlan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

/**
 * Mostly used as a facade for all Petclinic controllers Also a placeholder
 * for @Transactional and @Cacheable annotations
 *
 * @author Michael Isvy
 */
@Service
public class PetService {

	private PetRepository petRepository;

	private VisitRepository visitRepository;


	@Autowired
	public PetService(PetRepository petRepository,
			VisitRepository visitRepository) {
		this.petRepository = petRepository;
		this.visitRepository = visitRepository;
	}

	@Transactional(readOnly = true)
	public Collection<PetType> findPetTypes() throws DataAccessException {
		return petRepository.findPetTypes();
	}

	@Transactional
	public void saveVisit(Visit visit) throws DataAccessException {
		visitRepository.save(visit);
	}

    @Transactional
    public void deleteVisit(Visit visit) throws DataAccessException, DuplicatedPetNameException {
        Pet pet = petRepository.findById(visit.getPet().getId()).orElse(null);
        pet.removeVisit(visit);
        savePet(pet);
        visitRepository.deleteById(visit.getId());
    }

    @Transactional(readOnly = true)
    public Visit findVisitById(int id) throws DataAccessException {
        return visitRepository.findById(id);
    }


	@Transactional(readOnly = true)
	public Pet findPetById(int id) throws DataAccessException {
		return petRepository.findById(id);
	}

	@Transactional(rollbackFor = DuplicatedPetNameException.class)
	public void savePet(Pet pet) throws DataAccessException, DuplicatedPetNameException {
			if(pet.getOwner()!=null){
				Pet otherPet=pet.getOwner().getPetwithIdDifferent(pet.getName(), pet.getId());
            	if (StringUtils.hasLength(pet.getName()) &&  (otherPet!= null && otherPet.getId()!=pet.getId())) {
            		throw new DuplicatedPetNameException();
            	}else
                	petRepository.save(pet);
			}else
				petRepository.save(pet);
	}

    @Transactional
    public void deletePet(Pet pet) throws DataAccessException {
        petRepository.delete(pet);
    }

    @Transactional
    public void deletePet(Integer id) throws DataAccessException {
        petRepository.deleteById(id);
    }

	@Transactional(readOnly = true)
	public Collection<Visit> findVisitsByPetId(int petId) {
		return visitRepository.findByPetId(petId);
	}

	@Transactional(readOnly = true)
	public Collection<Visit> findVisitsOnMonthByPetId(int petId, LocalDate date) {
		return visitRepository.findVisitsOnMonthByPetId(petId, date.getMonthValue(), date.getYear());
	}

	@Transactional(readOnly = true)
	public Collection<Pet> findPetsByOwnerId(int ownerId) {
		return petRepository.findByOwnerId(ownerId);
	}

	@Transactional(readOnly = true) 
	public Collection<PetType> findPetTypesForPlan(PricingPlan plan) {
		return petRepository.findPetTypesForPlan(plan);
	}
	

}
