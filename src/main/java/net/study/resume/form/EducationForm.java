package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Education;

public class EducationForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;

	private List<Education> items = new ArrayList<>();

	public EducationForm() {
		super();
	}

	public EducationForm(List<Education> items) {
		super();
		this.items = items;
	}

	public List<Education> getItems() {
		return items;
	}

	public void setItems(List<Education> items) {
		this.items = items;
	}


	
	
}
