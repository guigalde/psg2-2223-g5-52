package org.springframework.samples.petclinic.causes;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CauseService {

    private CauseRepository causeRepository;

    @Autowired
    public CauseService(CauseRepository causeRepository) {
        this.causeRepository = causeRepository;
    }

    @Transactional
	public void saveCause(Cause cause) throws DataAccessException {
		causeRepository.save(cause);
	}

    @Transactional(readOnly = true)
    public List<Cause> getAllCauses() {
        List<Cause> listCauses = new ArrayList<>();
        causeRepository.findAll().forEach(c->listCauses.add(c));
        return listCauses;
    }

    @Transactional
    public void deleteCause(Cause cause) throws DataAccessException {
        causeRepository.delete(cause);
    }


}
