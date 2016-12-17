package net.study.resume.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.study.resume.entity.Profile;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.service.FindProfileService;

@Service
public class FindProfileServiceImpl implements FindProfileService {

	@Autowired
	private ProfileRepository profileRepository;
	
	@Override
	public Profile findByUid(String uid) {
		return profileRepository.findByUid(uid);
	}

}
