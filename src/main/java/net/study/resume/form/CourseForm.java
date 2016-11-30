package net.study.resume.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.study.resume.entity.Course;

public class CourseForm implements Serializable {
	private static final long serialVersionUID = -6263180607654385965L;

	private List<Course> items = new ArrayList<>();

	public CourseForm() {
		super();
	}

	public CourseForm(List<Course> items) {
		super();
		this.items = items;
	}

	public List<Course> getItems() {
		return items;
	}

	public void setItems(List<Course> items) {
		this.items = items;
	}

	
	
	
}
