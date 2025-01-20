package vn.hoidanit.laptopshop.service;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        vn.hoidanit.laptopshop.domain.User users = userService.findUserByEmail(username);
        if (users == null) {
            throw new UsernameNotFoundException("Email does not exist!");
        } else {
            return new User(username, users.getPassword(),
                    Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + users.getRole().getName())));
        }
    }

}
