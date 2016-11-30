package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Language;

@RepositoryDefinition(domainClass=Language.class, idClass=Long.class)
public interface LanguageCategoryRepository {

	List<Language> findAll(Sort sort);
}
