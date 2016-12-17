package net.study.resume.form;

import java.io.Serializable;

import net.study.resume.entity.Contacts;

public class ContactsForm implements Serializable {
	private static final long serialVersionUID = 8059514298630859731L;

	private Contacts contacts;

	public ContactsForm() {
		super();
	}

	public ContactsForm(Contacts contacts) {
		super();
		this.contacts = contacts;
	}

	public Contacts getContacts() {
		return contacts;
	}

	public void setContacts(Contacts contacts) {
		this.contacts = contacts;
	}
}