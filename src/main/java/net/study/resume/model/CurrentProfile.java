package net.study.resume.model;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import net.study.resume.Constants;
import net.study.resume.entity.Profile;

public class CurrentProfile extends User{
	private static final long serialVersionUID = 5273148677718047972L;
	private final Long id;
	private final String fullName;
	private final String uid;
	
	public CurrentProfile(Profile profile) {
		super(profile.getUid(), profile.getPassword(), true, true, true, true, Collections.singleton(new SimpleGrantedAuthority(Constants.USER)));
		this.id = profile.getId();
		this.fullName = profile.getFullName();
		this.uid = profile.getUid();
	}
	
	public Long getId() {
		return id;
	}
	
	public String getFullName() {
		return fullName;
	}
	
	public String getUid(){
		return uid;
	}

	@Override
	public String toString() {
		return String.format("CurrentAccount [id=%s, username=%s]", id, getUsername());
	}
}
