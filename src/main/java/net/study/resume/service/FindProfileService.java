package net.study.resume.service;

import net.study.resume.entity.Profile;

public interface FindProfileService {

	Profile findByUid(String uid);
}
