package net.study.resume.util;

import net.study.resume.entity.Contacts;
import net.study.resume.entity.Profile;

public class FormUtil {

	public static Contacts setBlankItemsAsNull(Contacts contacts) {
		ProfileDataUtil.setEmptyProfileFieldsAsNull(contacts, ProfileDataUtil.CONTACTS_FIELDS);
		return contacts;
	}
	
	public static Profile setBlankItemsAsNull(Profile profile) {
		ProfileDataUtil.setEmptyProfileFieldsAsNull(profile, ProfileDataUtil.GENERAL_FIELDS);
		return profile;
	}
	
	public static Profile setBlankItemAsNull(Profile profile) {
		ProfileDataUtil.setEmptyProfileFieldsAsNull(profile, ProfileDataUtil.INFO_FIELD);
		return profile;
	}
	
	public static Profile setAllProfileCollectionsAsEmpty(Profile profile) {
		ProfileDataUtil.setAllProfileCollectionsAsEmpty(profile);
		return profile;
	}
}
