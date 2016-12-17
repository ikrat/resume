package net.study.resume.service;

import java.util.List;

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
import net.study.resume.form.SignUpForm;

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
	
	//List<Certificate> listCertificates(long idProfile);
	
	void updatePractics(long idProfile, List<Practic> practics);
	
	void updateHobbies(long idProfile, List<Hobby> hobbies);
	
	void updateSkills(long idProfile, List<Skill> skills);
	
	void updateCourses(long idProfile, List<Course> courses);

	void updateEducations(long idProfile, List<Education> educations);
	
	void updateLanguages (long idProfile, List<Language> languages);
	
	void updateProfile (long idProfile, Profile profileForm);
	
	void updateContacts (long idProfile, Contacts contactsForm);
	
	//void updateCertificates(long idProfile, List<Certificate> certificates);
}
