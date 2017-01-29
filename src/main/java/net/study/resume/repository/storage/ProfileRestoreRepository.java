package net.study.resume.repository.storage;

import org.springframework.data.repository.CrudRepository;

import net.study.resume.entity.ProfileRestore;

public interface ProfileRestoreRepository extends CrudRepository<ProfileRestore, Long> {

	ProfileRestore findByToken(String token);
	
	ProfileRestore findByProfileId(Long id);
}
