package net.study.resume.form;

import java.io.Serializable;

import net.study.resume.annotation.constraints.FieldMatch;

@FieldMatch(first="newPassword", second="confirmNewPassword")
public class ChangePasswordForm implements Serializable{
	private static final long serialVersionUID = 2433818437368604865L;

	private String newPassword;
	
	private String confirmNewPassword;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}

	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	
}
