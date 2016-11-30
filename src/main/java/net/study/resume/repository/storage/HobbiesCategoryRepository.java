package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Hobby;

@RepositoryDefinition(domainClass=Hobby.class, idClass=Long.class)
public interface HobbiesCategoryRepository {

	List<Hobby> findAll(Sort sort);
}
