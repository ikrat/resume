package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Language;

public class LanguagesForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;

	private List<Language> items = new ArrayList<>();

	public LanguagesForm() {
		super();
	}

	public LanguagesForm(List<Language> items) {
		super();
		this.items = items;
	}

	public List<Language> getItems() {
		return items;
	}

	public void setItems(List<Language> items) {
		this.items = items;
	}


	
}
