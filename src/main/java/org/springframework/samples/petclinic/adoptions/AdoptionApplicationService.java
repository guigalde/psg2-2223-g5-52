package org.springframework.samples.petclinic.adoptions;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdoptionApplicationService {

    private AdoptionApplicationRepository adoptionApplicationRepository;
    
    @Autowired
    public AdoptionApplicationService(AdoptionApplicationRepository adoptionApplicationRepository){
        this.adoptionApplicationRepository=adoptionApplicationRepository;
    }

    @Transactional(readOnly=true)
    public List<AdoptionApplication> getAdoptionApplicationByOwnerId(Integer ownerId){
        return adoptionApplicationRepository.findApplicationByPublishingOwnerId(ownerId);
    }


    @Transactional
    public void saveAplication(AdoptionApplication application) {
        this.adoptionApplicationRepository.save(application);
    }

    public AdoptionApplication findExistingApplication(Integer ownerId, Integer adoptionId) {
        return adoptionApplicationRepository.findExistingApplication(ownerId, adoptionId);
    }
}
