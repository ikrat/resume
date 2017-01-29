package net.study.resume.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.restfb.types.User;

import net.study.resume.entity.Profile;
import net.study.resume.exception.CantCompleteClientRequestException;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.service.SocialService;
import net.study.resume.util.DataUtil;

@Service
public class FacebookSocialService implements SocialService<User> {

	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Value("${generate.uid.suffix.length}")
	private int generateUidSuffixLength;

	@Value("${generate.uid.alphabet}")
	private String generateUidAlphabet;

	@Value("${generate.uid.max.try.count}")
	private int maxTryCountToGenerateUid;
	
	@Override
	public Profile loginViaSocialNetwork(User model) {
		if(StringUtils.isNotBlank(model.getEmail())) {
			Profile p = profileRepository.findByEmail(model.getEmail());
			if(p != null){
				return p;
			}
		}
		Profile profile = new Profile();
		profile.setUid(generateProfileUid(model));
		profile.setFirstName(DataUtil.capitalizeName(model.getFirstName()));
		profile.setLastName(DataUtil.capitalizeName(model.getLastName()));
		profile.setEmail(model.getEmail());
		profile.setPassword(passwordEncoder.encode("qwerty"));
		profile.setCompleted(false);
		profileRepository.save(profile);
		return profile;
	}
	
	private String generateProfileUid(User user) throws CantCompleteClientRequestException {
		String baseUid = DataUtil.generateProfileUidFacebook(user);
		String uid = baseUid;
		for (int i = 0; profileRepository.countByUid(uid) > 0; i++) {
			uid = DataUtil.regenerateUidWithRandomSuffix(baseUid, generateUidAlphabet, generateUidSuffixLength);
			if( i > maxTryCountToGenerateUid) {
				throw new CantCompleteClientRequestException("Can`t generate unique uid for profile: " + baseUid + ":maxTryCountToGenerateUid detected.");
			}
		}
		return uid;
	}

}
