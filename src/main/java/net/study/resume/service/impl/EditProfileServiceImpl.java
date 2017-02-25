package net.study.resume.service.impl;

import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.util.StringUtils;

import net.study.resume.entity.Certificate;
import net.study.resume.entity.Contacts;
import net.study.resume.entity.Course;
import net.study.resume.entity.Education;
import net.study.resume.entity.Hobby;
import net.study.resume.entity.HobbyName;
import net.study.resume.entity.Language;
import net.study.resume.entity.Practic;
import net.study.resume.entity.Profile;
import net.study.resume.entity.ProfileRestore;
import net.study.resume.entity.Skill;
import net.study.resume.entity.SkillCategory;
import net.study.resume.exception.CantCompleteClientRequestException;
import net.study.resume.form.ChangePasswordForm;
import net.study.resume.form.SignUpForm;
import net.study.resume.model.CurrentProfile;
import net.study.resume.repository.search.ProfileSearchRepository;
import net.study.resume.repository.storage.HobbiesCategoryRepository;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.repository.storage.SkillCategoryRepository;
import net.study.resume.service.EditProfileService;
import net.study.resume.service.NotificationManagerService;
import net.study.resume.util.DataUtil;

@Service
@SuppressWarnings("unchecked")
public class EditProfileServiceImpl implements EditProfileService {
	private static final Logger LOGGER = LoggerFactory.getLogger(EditProfileServiceImpl.class);

	@Autowired
	private ProfileSearchRepository profileSearchRepository;
	
	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private SkillCategoryRepository skillCategoryRepository;
	
	@Autowired
	private HobbiesCategoryRepository hobbiesCategoryRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private NotificationManagerService notificationManagerService;
	
	@Value("${app.host}")
	private String appHost;
	
	@Value("${generate.uid.suffix.length}")
	private int generateUidSuffixLength;

	@Value("${generate.uid.alphabet}")
	private String generateUidAlphabet;

	@Value("${generate.uid.max.try.count}")
	private int maxTryCountToGenerateUid;
	
	@Value("${email.restoreLink.address}")
	private String emailRestoreLinkAddress;
	
//Profile create
	@Override
	@Transactional
	public Profile createNewProfile(SignUpForm signUpForm) {
		Profile profile = new Profile();
		checkEmailIsUnique(signUpForm.getEmail());
		profile.setUid(generateProfileUid(signUpForm.getFirstName(), signUpForm.getLastName()));
		profile.setFirstName(DataUtil.capitalizeName(signUpForm.getFirstName()));
		profile.setLastName(DataUtil.capitalizeName(signUpForm.getLastName()));
		profile.setEmail(signUpForm.getEmail());
		profile.setPassword(passwordEncoder.encode(signUpForm.getPassword()));
		profile.setCompleted(false);
		profileRepository.save(profile);
		registerCreateIndexProfileIfTransactionSuccess(profile);
		return profile;
	}
	
	private void checkEmailIsUnique(String email) throws CantCompleteClientRequestException {
		if(profileRepository.countByEmail(email) != 0) {
			throw new CantCompleteClientRequestException("Email is already used.");
		}
	}

	private void registerCreateIndexProfileIfTransactionSuccess(final Profile profile) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("New profile created: {}", profile.getUid());
				profile.setCertificates(Collections.EMPTY_LIST);
				profile.setPractics(Collections.EMPTY_LIST);
				profile.setLanguages(Collections.EMPTY_LIST);
				profile.setSkills(Collections.EMPTY_LIST);
				profile.setCourses(Collections.EMPTY_LIST);
				profile.setEducations(Collections.EMPTY_LIST);
				profileSearchRepository.save(profile);
				LOGGER.info("New profile index created: {}", profile.getUid());
			}
		});
	}

	private String generateProfileUid(String firstName, String lastName) throws CantCompleteClientRequestException {
		String baseUid = DataUtil.generateProfileUid(firstName, lastName);
		String uid = baseUid;
		for (int i = 0; profileRepository.countByUid(uid) > 0; i++ ) {
			uid = DataUtil.regenerateUidWithRandomSuffix(baseUid, generateUidAlphabet, generateUidSuffixLength);
			if(i>=maxTryCountToGenerateUid) {
				throw new CantCompleteClientRequestException("Can`t generate unique uid for profile: "+baseUid+ ": maxTryCountToGenerateUid detected");
			}
		}
		return uid;
	}
	
	
	
//Skills	
	@Override
	public List<Skill> listSkills(long idProfile) {
		return profileRepository.findOne(idProfile).getSkills();
	}

	@Override
	public List<SkillCategory> listSkillCategories() {
		return skillCategoryRepository.findAll(new Sort("id"));
	}
	
	@Override
	@Transactional
	public void updateSkills(long idProfile, List<Skill> updateData) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(updateData, profile.getSkills())) {
			LOGGER.debug("Profile skills: nothing to update");
			return;
		} else {
			profile.setSkills(updateData);
			profileRepository.save(profile);
		}
	}

//Hobby	
	@Override
	public List<Hobby> listHobbies(long idProfile) {
		return profileRepository.findOne(idProfile).getHobbies();
	}

	@Override
	public List<HobbyName> listHobbiesName() {
		return hobbiesCategoryRepository.findAll(new Sort("name"));
	}

	@Override
	public void updateHobbies(long idProfile, List<Hobby> updateData) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(updateData, profile.getHobbies())) {
			LOGGER.debug("Profile hobbies: nothing to update.");
			return;
		} else {
			profile.setHobbies(updateData);
			profileRepository.save(profile);
		}
	}

	
//Practice	
	@Override
	public List<Practic> listPractics(long idProfile) {
		return profileRepository.findOne(idProfile).getPractics();
	}

	@Override
	public void updatePractics(long idProfile, List<Practic> practics) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(practics, profile.getPractics())) {
			LOGGER.debug("Profile practics: nothing to update.");
			return;
		} else {
			profile.setPractics(practics);
			profileRepository.save(profile);
		}
	}

	
//Courses	
	@Override
	public List<Course> listCourses(long idProfile) {
		return profileRepository.findOne(idProfile).getCourses();
	}

	@Override
	public void updateCourses(long idProfile, List<Course> courses) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(courses, profile.getCourses())) {
			LOGGER.debug("Profile courses: nothing to update.");
			return;
		} else {
			profile.setCourses(courses);
			profileRepository.save(profile);
		}
	}

	
//Education	
	@Override
	public List<Education> listEducations(long idProfile) {
		return profileRepository.findOne(idProfile).getEducations();
	}

	@Override
	public void updateEducations(long idProfile, List<Education> educations) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(educations, profile.getEducations())) {
			LOGGER.debug("Profile educations: nothing to update.");
			return;
		} else {
			profile.setEducations(educations);
			profileRepository.save(profile);
		}
	}

	


//Languages	
	@Override
	public List<Language> listLanguages(long idProfile) {
		return profileRepository.findOne(idProfile).getLanguages();
	}

	@Override
	public void updateLanguages(long idProfile, List<Language> languages) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(languages, profile.getLanguages())) {
			LOGGER.debug("Profile languages: nothing to update.");
			return;
		} else {
			profile.setLanguages(languages);
			profileRepository.save(profile);
		}
	}

	
//Profile update	
	@Override
	public Profile profile(long idProfile) {
		return profileRepository.findOne(idProfile);
	}

	@Override
	@Transactional
	public void updateProfile(long idProfile, Profile profile) {
		Profile prof = profileRepository.findOne(idProfile);
		checkEmailIsUniqueAfterReg(idProfile, profile.getEmail());
		checkPhoneIsUniqueAfterReg(idProfile, profile.getPhone());
		if(StringUtils.isEmpty(profile.getBirthDay())){
			prof.setBirthDay(null);
		} else {
			prof.setBirthDay(profile.getBirthDay());
		}
		prof.setCountry(profile.getCountry());
		prof.setCity(profile.getCity());
		prof.setEmail(profile.getEmail());
		prof.setPhone(profile.getPhone());
		prof.setObjective(profile.getObjective());
		prof.setSummary(profile.getSummary());
		prof.setLargePhoto(profile.getLargePhoto());
		prof.setSmallPhoto(profile.getSmallPhoto());
		profileRepository.save(prof);
		registerUpdateIndexAccountIfTransactionSuccess(idProfile, prof);
	}
	

	private void checkEmailIsUniqueAfterReg(Long idProfile, String email) throws CantCompleteClientRequestException{
		Profile profile = profileRepository.findByEmail(email);
		if(profile != null) {
			if(profile.getEmail().isEmpty()) {
				throw new CantCompleteClientRequestException("Please input email.");
			}
			if(!idProfile.equals(profile.getId())){
				LOGGER.error("Email is already used.");
				throw new CantCompleteClientRequestException("Email " + email + " is already used.");
			}
		}
	}

	private void checkPhoneIsUniqueAfterReg(Long idProfile, String phone) throws CantCompleteClientRequestException {
		Profile profile = profileRepository.findByPhone(phone);
		if(profile != null) {
			if(!idProfile.equals(profile.getId())){
				LOGGER.error("Phone is already used.");
				throw new CantCompleteClientRequestException("Phone is already used.");
			}
		}
	}

	private void registerUpdateIndexAccountIfTransactionSuccess(final long idProfile, final Profile prof) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile updated");
				updateIndexProfile(idProfile, prof);
			}
		});
	}

	private void updateIndexProfile(long idProfile, Profile profile) {
		profileSearchRepository.save(profile);
		LOGGER.info("Profile index updated");
	}
	
//Contacts	
	@Override
	public Contacts contacts(long idProfile) {
		return profileRepository.findOne(idProfile).getContacts();
	}

	@Override
	@Transactional
	public void updateContacts(long idProfile, Contacts contacts) {
		Profile profile = profileRepository.findOne(idProfile);
		profile.setContacts(contacts);
		profileRepository.save(profile);
	}

	
/* Info	*/
	@Override
	@Transactional
	public void updateInfo(long idProfile, Profile info) {
		Profile profile = profileRepository.findOne(idProfile);
		profile.setInfo(info.getInfo());
		profileRepository.save(profile);
	}

	
/* Certificates */	
	@Override
	public List<Certificate> listCertificates(long idProfile) {
		return profileRepository.findOne(idProfile).getCertificates();
	}

	@Override
	@Transactional
	public void updateCertificates(long idProfile, List<Certificate> certificates) {
		Profile profile = profileRepository.findOne(idProfile);
		if(CollectionUtils.isEqualCollection(certificates, profile.getCertificates())) {
			LOGGER.debug("Profile certificates: nothing to update");
			return;
		} else {
			profile.setCertificates(certificates);
			profileRepository.save(profile);
		}
	}

	@Override
	@Transactional
	public void addRestoreToken(long idProfile, String token) {
		LOGGER.debug("Profile {}: creating restore token", idProfile);
		Profile profile = profileRepository.findById(idProfile);
		ProfileRestore restore = new ProfileRestore();
		restore.setId(profile.getId());
		restore.setProfile(profile);
		restore.setToken(token);
		profile.setProfileRestore(restore);
		profileRepository.save(profile);
		sendRestoreLinkNotification(profile, emailRestoreLinkAddress + token);
	}
	
	private void sendRestoreLinkNotification(final Profile profile, final String restoreLink) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit(){
				LOGGER.info("Profile {}: restore link has been created", profile.getId());
				notificationManagerService.sendRestoreAccessLink(profile, restoreLink);
			}
		});
	}

	@Override
	@Transactional
	public void removeRestoreToken(long idProfile) {
		LOGGER.debug("Profile {}: removing restore token", idProfile);
		Profile profile = profileRepository.findById(idProfile);
		profile.setProfileRestore(null);
		profileRepository.save(profile);
	}

	@Override
	@Transactional
	public Profile updatePassword(CurrentProfile currentProfile, ChangePasswordForm changeForm) {
		LOGGER.debug("Profile {}: change password", currentProfile);
		Profile profile = profileRepository.findOne(currentProfile.getId());
		profile.setPassword(passwordEncoder.encode(changeForm.getNewPassword()));
		profileRepository.save(profile);
		sendChangeProfileNotification(profile);
		return profile;
	}

	private void sendChangeProfileNotification(final Profile profile) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit(){
				LOGGER.info("Profile {}: password has been changed", profile.getId());
				notificationManagerService.sendPasswordChanged(profile);
			}
		});
	}
}
