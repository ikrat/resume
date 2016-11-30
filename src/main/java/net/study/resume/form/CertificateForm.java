package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Certificate;

public class CertificateForm implements Serializable{
	private static final long serialVersionUID = 2422367977327843525L;

	private List<Certificate> certificates = new ArrayList<>();

	public CertificateForm() {
		super();
	}

	public CertificateForm(List<Certificate> certificates) {
		super();
		this.certificates = certificates;
	}

	public List<Certificate> getCertificates() {
		return certificates;
	}

	public void setCertificates(List<Certificate> certificates) {
		this.certificates = certificates;
	}
	
	
}
