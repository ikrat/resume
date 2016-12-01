package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import net.study.resume.entity.Skill;


public class SkillForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;
	@Valid
	private List<Skill> items = new ArrayList<>();
	
	public SkillForm() {
		super();
	}

	public SkillForm(List<Skill> items) {
		super();
		this.items = items;
	}

	public List<Skill> getItems() {
		return items;
	}

	public void setItems(List<Skill> items) {
		this.items = items;
	}
}
