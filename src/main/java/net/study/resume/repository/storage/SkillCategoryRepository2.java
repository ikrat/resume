package net.study.resume.repository.storage;

import org.springframework.data.repository.PagingAndSortingRepository;

import net.study.resume.entity.SkillCategory;

public interface SkillCategoryRepository2 extends PagingAndSortingRepository<SkillCategory, Long> {
	
}