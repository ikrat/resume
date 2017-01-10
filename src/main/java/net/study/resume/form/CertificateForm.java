package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Certificate;

public class CertificateForm implements Serializable{
	private static final long serialVersionUID = 2422367977327843525L;

	private List<Certificate> items = new ArrayList<>();

	public CertificateForm() {
		super();
	}

	public CertificateForm(List<Certificate> items) {
		super();
		this.items = items;
	}

	public List<Certificate> getItems() {
		return items;
	}

	public void setItems(List<Certificate> items) {
		this.items = items;
	}

}
