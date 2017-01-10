package net.study.resume.service;

import net.study.resume.form.ProfileForm;
import net.study.resume.form.UploadForm;

public interface PhotoDownloadService {

	void downloadPhoto(ProfileForm form);
	
	void downloadCertificate(UploadForm form);
}
