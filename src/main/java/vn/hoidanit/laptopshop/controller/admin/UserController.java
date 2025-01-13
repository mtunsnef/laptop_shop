package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.util.*;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.RoleService;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {
    // DI : dependency injection
    private final UserService userService;
    private final RoleService roleService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String testString = this.userService.handleHello();
        model.addAttribute("eric", testString);
        List<User> arrUsers = this.userService.getAllUser();
        System.out.println(arrUsers);
        User users = this.userService.findUserByEmail("admin@gmail.com");
        System.out.println(users);
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> userL = this.userService.getAllUser();
        model.addAttribute("userL", userL);
        return "admin/user/table-user";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        List<Role> roles = this.roleService.getAllRole();
        model.addAttribute("roleList", roles);
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("avtFile") MultipartFile file) {
        String avatar = this.uploadService.handleSaveFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        // save
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}") // GET
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println(id);
        model.addAttribute("userId", this.userService.findUserById(id));
        return "admin/user/user-detail";
    }

    @GetMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.findUserById(id);
        model.addAttribute("updateUser", currentUser);
        List<Role> roles = this.roleService.getAllRole();
        model.addAttribute("roleList", roles);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User user,
            @RequestParam("avtFile") MultipartFile file) {
        User currentUser = this.userService.findUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setRole(this.roleService.findById(user.getRole().getId()));
            String avatar = this.uploadService.handleSaveFile(file, "avatar");
            // save
            currentUser.setAvatar(avatar);
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.findUserById(id);
        model.addAttribute("deleteUser", currentUser);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("deleteUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }
}
