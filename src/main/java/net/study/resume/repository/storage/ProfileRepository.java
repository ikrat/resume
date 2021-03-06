package net.study.resume.repository.storage;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.study.resume.entity.Profile;

public interface ProfileRepository extends PagingAndSortingRepository<Profile, Long> {

	Profile findByUid(String uid);

	Profile findByEmail(String email);

	Profile findByPhone(String phone);
	
	Profile findById(Long id);
	
	Profile findByUidOrEmailOrPhone(String uid, String email, String phone);
	
	Profile findByEmailOrPhone(String email, String phone);
	
	Profile findByProfileRestoreToken(String token);

	int countByUid(String uid);
	
	int countByEmail(String email);
	
	int countByPhone(String phone);

	Page<Profile> findAllByCompletedTrue(Pageable pageable);

	List<Profile> findByCompletedFalseAndCreatedBefore(Timestamp oldDate);
}
