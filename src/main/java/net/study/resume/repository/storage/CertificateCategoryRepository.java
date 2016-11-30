package net.study.resume.repository.storage;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.RepositoryDefinition;

import net.study.resume.entity.Certificate;

@RepositoryDefinition(domainClass=Certificate.class, idClass=Long.class)
public interface CertificateCategoryRepository {

	List<Certificate> findAll(Sort sort);
}
