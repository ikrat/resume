package net.study.resume.util;

import java.util.Collections;

import org.apache.commons.lang.StringUtils;

import net.study.resume.entity.Profile;

public class ProfileDataUtil {

	public static final String[] CONTACTS_FIELDS = { "skype", "vkontakte", "facebook", "linkedin", "github", "stackoverflow" };
	public static final String[] GENERAL_FIELDS = { "country", "city", "email", "phone", "objective", "summary" };
	public static final String[] INFO_FIELD = { "info" };
	public static final String[] COLLECTION_FIELDS = {"certificate", "course", "education", "hobby", "language", "skill", "practic"};
	
	public static void setEmptyProfileFieldsAsNull(Object object, String[] fields) {
		try {
			for (String field : fields) {
				String value = (String) ObjectDataUtil.getObjectField(object, field);
				if(StringUtils.isBlank(value)) {
					ObjectDataUtil.setObjectField(object, field, null);
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("Can`t write collection fields to " + object, e);
		}
	}
	
	public static void setAllProfileCollectionsAsEmpty(Profile profile) {
		try {
			for (String field : ProfileDataUtil.COLLECTION_FIELDS) {
				ObjectDataUtil.setObjectField(profile, field, Collections.EMPTY_LIST);
			}
		} catch (Exception e) {
			throw new RuntimeException("Can`t write collection fields to " + profile, e);
		}
	}
}
