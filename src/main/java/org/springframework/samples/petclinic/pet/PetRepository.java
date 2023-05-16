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

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.samples.petclinic.user.PricingPlan;

/**
 * Spring Data JPA specialization of the {@link PetRepository} interface
 *
 * @author Michael Isvy
 * @since 15.1.2013
 */
public interface PetRepository extends CrudRepository<Pet, Integer> {

	/**
	 * Retrieve all <code>PetType</code>s from the data store.
	 * @return a <code>Collection</code> of <code>PetType</code>s
	 */
	@Query("SELECT ptype FROM PetType ptype ORDER BY ptype.name")
	List<PetType> findPetTypes() throws DataAccessException;

	/**
	 * Retrieve a <code>Pet</code> from the data store by id.
	 * @param id the id to search for
	 * @return the <code>Pet</code> if found
	 * @throws org.springframework.dao.DataRetrievalFailureException if not found
	 */
	Pet findById(int id) throws DataAccessException;

	@Query("SELECT p FROM Pet p WHERE p.owner.id = :id")
	List<Pet> findByOwnerId(@Param("id") int id);

	@Query("SELECT p FROM PetType p WHERE p.name = :name")
	PetType findByName(@Param("name") String name);

	default List<PetType> findPetTypesForPlan(PricingPlan plan) {
		List<PetType> pets = new ArrayList<>();
		if(plan.getName().equals("BASIC")) {
			pets.add(findByName("dog"));
			pets.add(findByName("cat"));
		} else if(plan.getName().equals("ADVANCED")) {
			pets.add(findByName("dog"));
			pets.add(findByName("cat"));
			pets.add(findByName("bird"));
			pets.add(findByName("hamster"));
		} else {
			pets = findPetTypes();
		}
		return pets;
	}
}
