package net.study.resume.service;

import net.study.resume.entity.Profile;
import net.study.resume.form.UploadForm;

public interface PhotoDownloadService {

	void downloadPhoto(Profile form);
	
	void downloadCertificate(UploadForm form);
}
