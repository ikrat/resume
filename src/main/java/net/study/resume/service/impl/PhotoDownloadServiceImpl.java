package net.study.resume.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;
import net.study.resume.entity.Certificate;
import net.study.resume.entity.Profile;
import net.study.resume.form.ProfileForm;
import net.study.resume.form.UploadForm;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.service.EditProfileService;
import net.study.resume.service.PhotoDownloadService;
import net.study.resume.util.SecurityUtil;

@Service
public class PhotoDownloadServiceImpl implements PhotoDownloadService {
	
	@Value("download.photo.temporary")
	private String temporary;
	
	@Value("${download.photo.avatar}")
	private String mediaDir;
	
	@Autowired
	ProfileRepository profileRepository;
	
	@Autowired
	EditProfileService editProfileService;

	@Override
	public void downloadPhoto(ProfileForm form) {
		try {
			String uid = UUID.randomUUID().toString() + ".jpg";
			File photo = new File(temporary + uid);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(photo));
			FileCopyUtils.copy(form.getFile().getInputStream(), stream);
			Thumbnails.of(photo).size(400, 400).toFile(new File(mediaDir + "/avatar/" + uid));
			stream.close();
			String smallUid = uid.replace(".jpg", "-sm.jpg");
			Thumbnails.of(photo).size(110, 110).toFile(new File(mediaDir + "/avatar/" + smallUid));
			form.getProfile().setLargePhoto("/media/avatar/" + uid);
			form.getProfile().setSmallPhoto("/media/avatar/" + smallUid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void downloadCertificate(UploadForm form) {
		try {
			String uid = UUID.randomUUID().toString() + ".jpg";
			File photo = new File(temporary + uid);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(photo));
			FileCopyUtils.copy(form.getFile().getInputStream(), stream);
			Thumbnails.of(photo).size(900, 600).toFile(new File(mediaDir + "/certificates/" + uid));
			stream.close();
			String smallUid = uid.replace(".jpg", "-sm.jpg");
			Thumbnails.of(photo).size(100, 70).toFile(new File(mediaDir + "/certificates/" + smallUid));
			Profile profile = profileRepository.findOne(SecurityUtil.getCurrentIdProfile());
			Certificate certificate = new Certificate();
			certificate.setLargeUrl("/media/certificates/" + uid);
			certificate.setSmallUrl("/media/certificates/" + smallUid);
			certificate.setName(form.getName());
			certificate.setProfile(profile);
			profile.getCertificates().add(certificate);
			editProfileService.updateCertificates(SecurityUtil.getCurrentIdProfile(), profile.getCertificates());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
