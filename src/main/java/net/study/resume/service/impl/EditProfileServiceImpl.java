package net.study.resume.service.impl;

import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import net.study.resume.entity.Certificate;
import net.study.resume.entity.Contacts;
import net.study.resume.entity.Course;
import net.study.resume.entity.Education;
import net.study.resume.entity.Hobby;
import net.study.resume.entity.HobbyName;
import net.study.resume.entity.Language;
import net.study.resume.entity.Practic;
import net.study.resume.entity.Profile;
import net.study.resume.entity.Skill;
import net.study.resume.entity.SkillCategory;
import net.study.resume.exception.CantCompleteClientRequestException;
import net.study.resume.form.SignUpForm;
import net.study.resume.repository.search.ProfileSearchRepository;
import net.study.resume.repository.storage.HobbiesCategoryRepository;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.repository.storage.SkillCategoryRepository;
import net.study.resume.service.EditProfileService;
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
	
	@Value("${generate.uid.suffix.length}")
	private int generateUidSuffixLength;

	@Value("${generate.uid.alphabet}")
	private String generateUidAlphabet;

	@Value("${generate.uid.max.try.count}")
	private int maxTryCountToGenerateUid;
	
//Profile create
	@Override
	@Transactional
	public Profile createNewProfile(SignUpForm signUpForm) {
		Profile profile = new Profile();
		profile.setUid(generateProfileUid(signUpForm));
		profile.setFirstName(DataUtil.capitalizeName(signUpForm.getFirstName()));
		profile.setLastName(DataUtil.capitalizeName(signUpForm.getLastName()));
		profile.setPassword(signUpForm.getPassword());
		profile.setCompleted(false);
		profileRepository.save(profile);
		registerCreateIndexProfileIfTransactionSuccess(profile);
		return profile;
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
				profileSearchRepository.save(profile);
				LOGGER.info("New profile index created: {}", profile.getUid());
			}
		});
	}

	private String generateProfileUid(SignUpForm signUpForm) throws CantCompleteClientRequestException {
		String baseUid = DataUtil.generateProfileUid(signUpForm);
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
			registerUpdateIndexProfileSkillsIfTransactionSuccess(idProfile, updateData);
		}
	}

	private void registerUpdateIndexProfileSkillsIfTransactionSuccess(final long idProfile, final List<Skill> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile skills updated");
				updateIndexProfileSkills(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileSkills(long idProfile, List<Skill> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setSkills(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile skills index updated");
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
			registerUpdateIndexProfileHobbiesIfTransactionSuccess(idProfile, updateData);
		}
	}
	
	private void registerUpdateIndexProfileHobbiesIfTransactionSuccess(final long idProfile, final List<Hobby> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile hobbies updated");
				updateIndexProfileHobbies(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileHobbies(long idProfile, List<Hobby> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setHobbies(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile hobbies index updated");
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
			registerUpdateIndexProfilePracticsIfTransactionSuccess(idProfile, practics);
		}
	}
	
	private void registerUpdateIndexProfilePracticsIfTransactionSuccess(final long idProfile, final List<Practic> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile practice updated");
				updateIndexProfilePractice(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfilePractice(long idProfile, List<Practic> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setPractics(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile practice index updated");
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
			registerUpdateIndexProfileCoursesIfTransactionSuccess(idProfile, courses);
		}
	}
	
	private void registerUpdateIndexProfileCoursesIfTransactionSuccess(final long idProfile, final List<Course> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile courses updated");
				updateIndexProfileCourses(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileCourses(long idProfile, List<Course> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setCourses(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile courses index updated");
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
			registerUpdateIndexProfileEducationIfTransactionSuccess(idProfile, educations);
		}
	}
	
	private void registerUpdateIndexProfileEducationIfTransactionSuccess(final long idProfile, final List<Education> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile education updated");
				updateIndexProfileEducation(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileEducation(long idProfile, List<Education> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setEducations(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile education index updated");
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
			registerUpdateIndexProfileLanguagesIfTransactionSuccess(idProfile, languages);
		}
		
	}
	
	private void registerUpdateIndexProfileLanguagesIfTransactionSuccess(final long idProfile, final List<Language> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile languages updated");
				updateIndexProfileLanguage(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileLanguage(long idProfile, List<Language> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setLanguages(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile languages index updated");
	}

	
//Profile update	
	@Override
	public Profile profile(long idProfile) {
		return profileRepository.findOne(idProfile);
	}

	@Override
	@Transactional
	public void updateProfile(long idProfile, Profile profileForm) {
		Profile prof = profileRepository.findOne(idProfile);
		prof.setBirthDay(profileForm.getBirthDay());
		prof.setCountry(profileForm.getCountry());
		prof.setCity(profileForm.getCity());
		prof.setEmail(profileForm.getEmail());
		prof.setPhone(profileForm.getPhone());
		prof.setObjective(profileForm.getObjective());
		prof.setSummary(profileForm.getSummary());
		prof.setLargePhoto(profileForm.getLargePhoto());
		prof.setSmallPhoto(profileForm.getSmallPhoto());
		profileRepository.save(prof);
		registerUpdateIndexAccountIfTransactionSuccess(idProfile, prof);
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
		registerUpdateIndexProfileContactsIfTransactionSuccess(idProfile, contacts);
	}
	
	private void registerUpdateIndexProfileContactsIfTransactionSuccess(final long idProfile, final Contacts contacts) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile contacts updated");
				updateIndexProfileContacts(idProfile, contacts);
			}
		});
	}
	
	private void updateIndexProfileContacts(long idProfile, Contacts contacts) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setContacts(contacts);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile contacts index updated");
	}

	
/* Info	*/
	@Override
	@Transactional
	public void updateInfo(long idProfile, Profile info) {
		Profile profile = profileRepository.findOne(idProfile);
		profile.setInfo(info.getInfo());
		profileRepository.save(profile);
		registerUpdateIndexProfileInfoIfTransactionSuccess(idProfile, profile);
	}
	
	private void registerUpdateIndexProfileInfoIfTransactionSuccess(final long idProfile, final Profile profile) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile info updated");
				updateIndexProfileInfo(idProfile, profile);
			}
		});
	}
	
	private void updateIndexProfileInfo(long idProfile, Profile profile) {
		profileSearchRepository.save(profile);
		LOGGER.info("Profile info updated");
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
			registerUpdateIndexProfileCertificatesIfTransactionSuccess(idProfile, certificates);
		}
	}
	
	private void registerUpdateIndexProfileCertificatesIfTransactionSuccess(final long idProfile, final List<Certificate> updateData) {
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
			@Override
			public void afterCommit() {
				LOGGER.info("Profile certificates updated");
				updateIndexProfileCertificates(idProfile, updateData);
			}
		});
	}
	
	private void updateIndexProfileCertificates(long idProfile, List<Certificate> updateData) {
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setCertificates(updateData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile certificates index updated");
	}

	
}
