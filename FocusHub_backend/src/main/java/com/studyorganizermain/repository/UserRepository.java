package com.studyorganizermain.repository;

import com.studyorganizermain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    // Vérifie si un utilisateur existe avec cet email
    boolean existsByEmail(String email);

    // Vérifie si un utilisateur existe avec ce nom
    boolean existsByName(String name);

    // Trouve un utilisateur par son email
    Optional<User> findByEmail(String email);
}
