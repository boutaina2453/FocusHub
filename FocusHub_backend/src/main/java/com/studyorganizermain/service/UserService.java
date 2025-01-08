package com.studyorganizermain.service;

import com.studyorganizermain.entity.User;
import com.studyorganizermain.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // Enregistrement d'un nouvel utilisateur
    public User registerUser(User user) {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("Email already in use.");
        }
        if (userRepository.existsByName(user.getName())) {
            throw new RuntimeException("Username already in use.");
        }
        // Hashage du mot de passe avant l'enregistrement
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    // Authentification d'un utilisateur
    public User authenticateUser(String email, String password) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));

        // Vérification du mot de passe
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid email or password.");
        }

        return user; // Retourne l'utilisateur si l'authentification réussit
    }

    // Création d'un utilisateur (administrateur ou autre)
    public User createUser(User user) {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("Email already in use.");
        }
        if (userRepository.existsByName(user.getName())) {
            throw new RuntimeException("Username already in use.");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword())); // Assurez-vous de hasher le mot de passe
        return userRepository.save(user);
    }

    // Récupération de tous les utilisateurs
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Récupération d'un utilisateur par ID
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
    }

    // Mise à jour d'un utilisateur
    public User updateUser(Long id, User updatedUser) {
        User existingUser = getUserById(id);

        existingUser.setName(updatedUser.getName());
        existingUser.setEmail(updatedUser.getEmail());

        // Mise à jour du mot de passe (si fourni)
        if (updatedUser.getPassword() != null && !updatedUser.getPassword().isEmpty()) {
            existingUser.setPassword(passwordEncoder.encode(updatedUser.getPassword()));
        }

        existingUser.setTasks(updatedUser.getTasks());
        existingUser.setEvents(updatedUser.getEvents());
        existingUser.setGroups(updatedUser.getGroups());

        return userRepository.save(existingUser);
    }

    // Suppression d'un utilisateur
    public void deleteUser(Long id) {
        User user = getUserById(id);
        userRepository.delete(user);
    }
}
