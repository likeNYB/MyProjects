package com.example.insys.contoller;

import com.example.insys.models.User;
import com.example.insys.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.io.IOException;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        if (userService.authenticate(username, password)) {
            User loggedInUser = userService.getUserByUsername(username);
            model.addAttribute("loggedInUser", loggedInUser);
            return "redirect:/students";
        } else {
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "redirect:/";
    }

    @GetMapping("/admin")
    public String users(@RequestParam(name = "name", required = false) String username, Model model) {
        User loggedInUser = userService.getLoggedInUser();
        if (loggedInUser != null && "ADMIN".equals(loggedInUser.getRole())) {
            List<User> users = userService.listUsers(username);
                model.addAttribute("users", users);
                model.addAttribute("loggedInUser", loggedInUser);
            return "admin";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/user/create")
    public String createUser(User user) throws IOException {
        userService.saveUser(user);
        return "redirect:/admin";
    }

    @PostMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/admin";
    }
}
