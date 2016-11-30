package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Practic;

@RepositoryDefinition(domainClass=Practic.class, idClass=Long.class)
public interface PracticCategoryRepository {

	List<Practic> findAll(Sort sort);
}
