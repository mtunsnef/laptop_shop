package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;

//@RequestMapping("/user")
@Controller
public class UserController {
    // DI : dependency injection
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage() {
        String tesString = this.userService.handleHello();
        return "eric.html";
    }
}
// @RestController
// public class UserController {

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }
