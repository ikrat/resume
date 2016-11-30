package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Hobby;

public class HobbiesForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;

	private List<Hobby> items = new ArrayList<>();

	public HobbiesForm() {
		super();
	}

	public HobbiesForm(List<Hobby> items) {
		super();
		this.items = items;
	}

	public List<Hobby> getItems() {
		return items;
	}

	public void setItems(List<Hobby> items) {
		this.items = items;
	}

}
