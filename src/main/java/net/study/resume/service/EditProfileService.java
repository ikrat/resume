package net.study.resume.service;

import java.util.List;

import javax.annotation.Nonnull;

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
import net.study.resume.form.ChangePasswordForm;
import net.study.resume.form.SignUpForm;
import net.study.resume.model.CurrentProfile;

public interface EditProfileService {

	Profile createNewProfile (SignUpForm signUpForm);

	List<Hobby> listHobbies(long idProfile);
	
	List<HobbyName> listHobbiesName();
	
	List<SkillCategory> listSkillCategories();

	List<Skill> listSkills(long idProfile);
	
	List<Practic> listPractics(long idProfile);
	
	List<Course> listCourses(long idProfile);
	
	List<Education> listEducations(long idProfile);
	
	List<Language> listLanguages(long idProfile);
	
	Profile profile (long idProfile);
	
	Contacts contacts (long idProfile);
	
	List<Certificate> listCertificates(long idProfile);
	
	Profile updatePassword (CurrentProfile currentProfile, ChangePasswordForm changeForm); 
	
	void updatePractics(long idProfile, List<Practic> practics);
	
	void updateHobbies(long idProfile, List<Hobby> hobbies);
	
	void updateSkills(long idProfile, List<Skill> skills);
	
	void updateCourses(long idProfile, List<Course> courses);

	void updateEducations(long idProfile, List<Education> educations);
	
	void updateLanguages (long idProfile, List<Language> languages);
	
	void updateProfile (long idProfile, Profile profileForm);
	
	void updateContacts (long idProfile, @Nonnull Contacts contacts);
	
	void updateInfo(long idProfile, Profile profileForm);
	
	void updateCertificates(long idProfile, List<Certificate> certificates);
	
	void addRestoreToken(long idProfile, String token);
	
	void removeRestoreToken(long idProfile);
	
}
