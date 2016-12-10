package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.HobbyName;

@RepositoryDefinition(domainClass=HobbyName.class, idClass=Long.class)
public interface HobbiesCategoryRepository {

	List<HobbyName> findAll(Sort sort);
}
