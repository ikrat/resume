package net.study.resume.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.joda.time.LocalDate;
import org.joda.time.Years;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import net.study.resume.annotation.constraints.Adulthood;
import net.study.resume.annotation.constraints.EnglishLanguage;
import net.study.resume.annotation.constraints.PasswordStrength;
import net.study.resume.annotation.constraints.Phone;

@Entity
@Table(name = "profile")
@Document(indexName="profile")
public class Profile extends AbstractEntity<Long> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name = "PROFILE_ID_GENERATOR", sequenceName = "PROFILE_SEQ", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROFILE_ID_GENERATOR")
	@Column(unique = true, nullable = false)
	private Long id;

	@Column(name = "birth_day")
	//@Adulthood
	private Date birthDay;

	@Column
	@EnglishLanguage
	private String city;

	@Column
	@EnglishLanguage
	private String country;

	@Column(name = "first_name", nullable = false, length = 50)
	@EnglishLanguage
	private String firstName;

	@Column(name = "last_name", nullable = false, length = 50)
	@EnglishLanguage
	private String lastName;

	@Column(length = 2147483647)
	@EnglishLanguage
	private String objective;

	@Column(name = "large_photo", length = 255)
	private String largePhoto;

	@Column(name = "small_photo", length = 255)
	private String smallPhoto;

	@Column(length = 20)
	//@Phone
	//@Size(min=3, max=15, message="Size should be between 3 and 15 numbers.")
	private String phone;

	@Column(length = 100)
	//@Email
	private String email;
	
	@Column
	@EnglishLanguage
	private String info;

	@Column(length = 2147483647)
	@EnglishLanguage
	private String summary;

	@Column(nullable = false, length = 100)
	private String uid;
	
	@Column(nullable = false, length = 100)
	//@PasswordStrength
	private String password;
	
	@Column(nullable = false)
	@JsonIgnore
	private boolean completed;
	
	@Column(insertable=false)
	@JsonIgnore
	private Timestamp created;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JsonIgnore
	private List<Certificate> certificates;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@OrderBy("finishYear DESC, beginYear DESC, id DESC")
	@JsonIgnore
	private List<Education> educations;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@OrderBy("name ASC")
	@JsonIgnore
	private List<Hobby> hobbies;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	private List<Language> languages;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@OrderBy("finishDate DESC")
	private List<Practic> practics;

	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@OrderBy("id ASC")
	private List<Skill> skills;
	
	@OneToMany(mappedBy = "profile", cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@OrderBy("finishDate DESC")
	private List<Course> courses;
	
	@OneToOne(targetEntity = ProfileRestore.class, cascade = { CascadeType.MERGE, CascadeType.PERSIST }, mappedBy = "profile", orphanRemoval = true)
	@JsonIgnore
	private ProfileRestore profileRestore;

	public ProfileRestore getProfileRestore() {
		return profileRestore;
	}

	public void setProfileRestore(ProfileRestore profileRestore) {
		this.profileRestore = profileRestore;
	}

	@Embedded
	private Contacts contacts;
	
	@Embedded
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Profile() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getBirthDay() {
		return this.birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getObjective() {
		return this.objective;
	}

	public void setObjective(String objective) {
		this.objective = objective;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public List<Certificate> getCertificates() {
		return this.certificates;
	}

	public void setCertificates(List<Certificate> certificates) {
		this.certificates = certificates;
		updateListSetProfile(this.certificates);
	}

	public List<Education> getEducations() {
		return this.educations;
	}

	public void setEducations(List<Education> educations) {
		this.educations = educations;
		updateListSetProfile(this.educations);
	}

	public List<Hobby> getHobbies() {
		return this.hobbies;
	}

	public void setHobbies(List<Hobby> hobbies) {
		this.hobbies = hobbies;
		updateListSetProfile(this.hobbies);
	}

	public List<Language> getLanguages() {
		return this.languages;
	}

	public void setLanguages(List<Language> languages) {
		this.languages = languages;
		updateListSetProfile(this.languages);
	}

	public List<Practic> getPractics() {
		return this.practics;
	}

	public void setPractics(List<Practic> practics) {
		this.practics = practics;
		updateListSetProfile(this.practics);
	}

	public List<Skill> getSkills() {
		return this.skills;
	}

	public void setSkills(List<Skill> skills) {
		this.skills = skills;
		updateListSetProfile(this.skills);
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
		updateListSetProfile(this.courses);
	}

	public String getLargePhoto() {
		return largePhoto;
	}

	public void setLargePhoto(String largePhoto) {
		this.largePhoto = largePhoto;
	}

	public String getSmallPhoto() {
		return smallPhoto;
	}

	public void setSmallPhoto(String smallPhoto) {
		this.smallPhoto = smallPhoto;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	@Transient
	public String getFullName() {
		return firstName + " " + lastName;
	}
	
	@Transient
	public int getAge(){
		LocalDate birthdate = new LocalDate (birthDay);
		LocalDate now = new LocalDate();
		Years age = Years.yearsBetween(birthdate, now);
		return age.getYears();
	}
	
	@Transient
	public String getProfilePhoto(){
		if(largePhoto != null) {
			return largePhoto;
		} else {
			return "/static/img/unknown.jpg";
		}
	}
	
	public String updateProfilePhotos(String largePhoto, String smallPhoto) {
		String oldLargeImage = this.largePhoto;
		setLargePhoto(largePhoto);
		setSmallPhoto(smallPhoto);
		return oldLargeImage;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	// https://hibernate.atlassian.net/browse/HHH-7610
	public Contacts getContacts() {
		if(contacts == null) {
			contacts = new Contacts();
		}
		return contacts;
	}

	public void setContacts(Contacts contacts) {
		this.contacts = contacts;
	}
	
	private void updateListSetProfile(List<? extends ProfileEntity> list) {
		if(list != null) {
			for(ProfileEntity entity : list) {
				entity.setProfile(this);
			}
		}
	}

}