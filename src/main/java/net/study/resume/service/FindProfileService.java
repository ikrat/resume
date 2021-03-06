package net.study.resume.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import net.study.resume.entity.Profile;

public interface FindProfileService {

	Profile findByUid(String uid);
	
	Profile findById(long id);
	
	Page<Profile> findAll(Pageable pageable);
	
	Iterable<Profile> findAllForIndexing();
	
	Page<Profile> findBySearchQuery(String query, Pageable pageable);
	
	Profile findByRestoreToken(String token);
	
	Profile findByUniqueId(String anyUniqueId);
}
