package com.example.insys.services;

import com.example.insys.models.User;
import com.example.insys.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;



@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private User loggedInUser;
    private final User adminUser = new User(1L, "admin", "adminpass", "ADMIN");

    public List<User> listUsers(String username) {
        if (username != null) return userRepository.findByUsername(username);
        return userRepository.findAll();
    }
    public void saveUser(User user) {
        userRepository.save(user);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public User getUserByUsername(String username) {
        List<User> users = userRepository.findByUsername(username);
        return users.isEmpty() ? null : users.get(0);
    }

    public boolean authenticate(String username, String password) {
        User user = getUserByUsername(username);
        if (adminUser.getUsername().equals(username) && adminUser.getPassword().equals(password)) {
            loggedInUser = adminUser;
            return true;
        }
        if (user != null && user.getPassword().equals(password)) {
            loggedInUser = user;
            return true;
        }
        return false;
    }

    public User getLoggedInUser() {
        return loggedInUser;
    }
}