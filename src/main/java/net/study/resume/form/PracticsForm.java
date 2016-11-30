package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Practic;

public class PracticsForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;

	private List<Practic> items = new ArrayList<>();

	public PracticsForm() {
		super();
	}

	public PracticsForm(List<Practic> items) {
		super();
		this.items = items;
	}

	public List<Practic> getItems() {
		return items;
	}

	public void setItems(List<Practic> items) {
		this.items = items;
	}

	
}
