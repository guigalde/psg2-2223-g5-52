package org.springframework.samples.petclinic.causes;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DonationService {

    private DonationRepository donationRepository;

    @Autowired
    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Transactional
	public void saveDonation(Donation donation) throws DataAccessException {
		donationRepository.save(donation);
	}

    @Transactional(readOnly = true)
    public List<Donation> getCauseDonationsById(Integer donationId) {
        return donationRepository.findDonationCauseById(donationId);
    }
    
}
