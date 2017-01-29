package net.study.resume.service;

import net.study.resume.entity.Profile;
import net.study.resume.model.NotificationMessage;

public interface NotificationSenderService {

	void sendNotification(NotificationMessage message);
	
	String getDestinationAddress(Profile profile);
}
