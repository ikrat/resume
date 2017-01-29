package net.study.resume.service;

import net.study.resume.model.NotificationMessage;

public interface NotificationTemplateService {

	NotificationMessage createNotificationMessage (String templateName, Object model);
}
