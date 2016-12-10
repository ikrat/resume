package net.study.resume.form;

import java.io.Serializable;
import java.sql.Date;

public class ProfileForm implements Serializable {
	private static final long serialVersionUID = 8059514298630859731L;

	private String smallPhoto;
	private Date birthDay;
	private String country;
	private String city;
	private String email;
	private String phone;
	private String objective;
	private String summary;
	
	

	public String getSmallPhoto() {
		return smallPhoto;
	}


	public void setSmallPhoto(String smallPhoto) {
		this.smallPhoto = smallPhoto;
	}


	public Date getBirthDay() {
		return birthDay;
	}


	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getObjective() {
		return objective;
	}


	public void setObjective(String objective) {
		this.objective = objective;
	}


	public String getSummary() {
		return summary;
	}


	public void setSummary(String summary) {
		this.summary = summary;
	}
		
}
