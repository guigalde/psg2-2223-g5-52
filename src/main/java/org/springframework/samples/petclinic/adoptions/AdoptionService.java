package org.springframework.samples.petclinic.adoptions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdoptionService {
    
    private AdoptionRepository adoptionRepository;

    @Autowired
    public AdoptionService(AdoptionRepository adoptionRepository) {
        this.adoptionRepository = adoptionRepository;
    }

     @Transactional(readOnly = true)
    public Adoption getPendingdoptionsById(Integer ownerId, Integer petId) {
        return adoptionRepository.findPendingAdoptionById(ownerId, petId);
    }
    @Transactional
    public void saveAdoption(Adoption adoption) {
        this.adoptionRepository.save(adoption);
    }

    @Transactional(readOnly = true)
    public List<Adoption> getAll(){
        return adoptionRepository.findAll();
    }
    @Transactional(readOnly = true)
    public Adoption getAdoptionbyId(Integer id){
        return adoptionRepository.findAdoptionbyId(id);
    }

    @Transactional
    public void deleteAdoption(Integer id) throws DataAccessException {
        adoptionRepository.deleteById(id);
    }

}
