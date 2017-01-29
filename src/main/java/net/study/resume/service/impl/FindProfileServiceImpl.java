package net.study.resume.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.study.resume.entity.Profile;
import net.study.resume.entity.ProfileRestore;
import net.study.resume.exception.CantCompleteClientRequestException;
import net.study.resume.model.CurrentProfile;
import net.study.resume.repository.search.ProfileSearchRepository;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.repository.storage.ProfileRestoreRepository;
import net.study.resume.service.FindProfileService;

@Service
public class FindProfileServiceImpl implements FindProfileService, UserDetailsService {
	private static final Logger LOGGER = LoggerFactory.getLogger(FindProfileServiceImpl.class);
	
	
	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private ProfileSearchRepository profileSearchRepository;
	
	@Autowired
	private ProfileRestoreRepository profileRestoreRepository;
	
	@Value("${app.host}")
	private String appHost;
	
	@Override
	public Profile findByUid(String uid) {
		return profileRepository.findByUid(uid);
	}

	@Override
	public Page<Profile> findAll(Pageable pageable) {
		return profileRepository.findAll(pageable);
	}

	@Override
	@Transactional
	public Iterable<Profile> findAllForIndexing() {
		Iterable<Profile> all = profileRepository.findAll();
		for(Profile p : all) {
			p.getSkills().size();
			p.getCertificates().size();
			p.getLanguages().size();
			p.getPractics().size();
			p.getCourses().size();
		}
		return all;
	}

	@Override
	public Page<Profile> findBySearchQuery(String query, Pageable pageable) {
		return profileSearchRepository.findByObjectiveLikeOrSummaryLikeOrPracticsCompanyLikeOrPracticsPositionLike(query, query, query, query, pageable);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Profile profile = findProfile(username);
		if(profile != null) {
			return new CurrentProfile(profile);
		} else {
			LOGGER.error("Profile not found by " + username);
			throw new UsernameNotFoundException("Profile not found by " + username);
		}
	}

	
	private Profile findProfile(String anyUniqueId) {
		Profile profile = profileRepository.findByUid(anyUniqueId);
		if(profile == null) {
			profile = profileRepository.findByEmail(anyUniqueId);
			if(profile == null) {
				profile = profileRepository.findByPhone(anyUniqueId);
			}
		}
		return profile;
	}

	@Override
	public Profile findByRestoreToken(String token) {
		return profileRepository.findByProfileRestoreToken(token);
	}

	@Override
	public Profile findByUniqueId(String anyUniqueId) {
		return profileRepository.findByUidOrEmailOrPhone(anyUniqueId, anyUniqueId, anyUniqueId);
	}

	@Override
	public Profile findById(long id) {
		return profileRepository.findById(id);
	}
}
