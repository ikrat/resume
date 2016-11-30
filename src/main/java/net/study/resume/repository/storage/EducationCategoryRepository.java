package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Education;

@RepositoryDefinition(domainClass=Education.class, idClass=Long.class)
public interface EducationCategoryRepository {

	List<Education> findAll(Sort sort);
}
