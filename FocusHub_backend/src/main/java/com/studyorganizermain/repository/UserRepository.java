package com.studyorganizermain.repository;

import com.studyorganizermain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
