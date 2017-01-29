package net.study.resume.service;

import net.study.resume.entity.Profile;

public interface NotificationManagerService {

	void sendRestoreAccessLink(Profile profile, String restoreLink);
	
	void sendPasswordChanged(Profile profile);
}
