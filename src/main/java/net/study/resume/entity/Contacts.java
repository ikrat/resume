package net.study.resume.entity;

import java.io.Serializable;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@Access(AccessType.FIELD)
public class Contacts implements Serializable {
	private static final long serialVersionUID = 8068869188995971520L;

	@Column(length=80)
	private String skype;
	
	@Column(length=255)
	private String vkontakte;

	@Column(length=255)
	private String facebook;
	
	@Column(length=255)
	private String linkedin;
	
	@Column(length=255)
	private String github;
	
	@Column(length=255)
	private String stackoverflow;


	public String getSkype() {
		return skype;
	}

	public void setSkype(String skype) {
		this.skype = skype;
	}

	public String getVkontakte() {
		return vkontakte;
	}

	public void setVkontakte(String vkontakte) {
		this.vkontakte = vkontakte;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getLinkedin() {
		return linkedin;
	}

	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}

	public String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		this.github = github;
	}

	public String getStackoverflow() {
		return stackoverflow;
	}

	public void setStackoverflow(String stackoverflow) {
		this.stackoverflow = stackoverflow;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((facebook == null) ? 0 : facebook.hashCode());
		result = prime * result + ((github == null) ? 0 : github.hashCode());
		result = prime * result + ((linkedin == null) ? 0 : linkedin.hashCode());
		result = prime * result + ((skype == null) ? 0 : skype.hashCode());
		result = prime * result + ((stackoverflow == null) ? 0 : stackoverflow.hashCode());
		result = prime * result + ((vkontakte == null) ? 0 : vkontakte.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Contacts other = (Contacts) obj;
		if (facebook == null) {
			if (other.facebook != null)
				return false;
		} else if (!facebook.equals(other.facebook))
			return false;
		if (github == null) {
			if (other.github != null)
				return false;
		} else if (!github.equals(other.github))
			return false;
		if (linkedin == null) {
			if (other.linkedin != null)
				return false;
		} else if (!linkedin.equals(other.linkedin))
			return false;
		if (skype == null) {
			if (other.skype != null)
				return false;
		} else if (!skype.equals(other.skype))
			return false;
		if (stackoverflow == null) {
			if (other.stackoverflow != null)
				return false;
		} else if (!stackoverflow.equals(other.stackoverflow))
			return false;
		if (vkontakte == null) {
			if (other.vkontakte != null)
				return false;
		} else if (!vkontakte.equals(other.vkontakte))
			return false;
		return true;
	}
}
