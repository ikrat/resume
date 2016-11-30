package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Course;

@RepositoryDefinition(domainClass=Course.class, idClass=Long.class)
public interface CoursesCategoryRepository {

	List<Course> findAll(Sort sort);
}
