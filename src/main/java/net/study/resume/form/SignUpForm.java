package net.study.resume.form;

import java.io.Serializable;

import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import net.study.resume.annotation.constraints.EnglishLanguage;
import net.study.resume.annotation.constraints.FieldMatch;
import net.study.resume.annotation.constraints.PasswordStrength;

@FieldMatch(first="password", second="confirmPassword")
public class SignUpForm implements Serializable{
	private static final long serialVersionUID = 3163998060601093026L;

	@Size(min=1, max=50)
	@EnglishLanguage(withNumbers=false, withSpechSymbols=false)
	private String firstName;
	
	@Size(min=1, max=50)
	@EnglishLanguage(withNumbers=false, withSpechSymbols=false)
	private String lastName;
	
	@Email
	private String email;
	
	@PasswordStrength
	private String password;
	
	private String confirmPassword;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	@Transient
	public String getFullName() {
		return firstName + " " + lastName;
	}
}
