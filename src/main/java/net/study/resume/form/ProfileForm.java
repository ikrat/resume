package net.study.resume.form;

import org.springframework.web.multipart.MultipartFile;

import net.study.resume.entity.Profile;

public class ProfileForm {
	
	private MultipartFile file;
	
	private Profile profile;

	public ProfileForm(Profile profile) {
		super();
		this.profile = profile;
	}

	public ProfileForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	
	
}
