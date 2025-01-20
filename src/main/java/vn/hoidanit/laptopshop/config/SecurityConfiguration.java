package vn.hoidanit.laptopshop.config;

import org.apache.tomcat.util.net.DispatchType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.DispatcherType;
import vn.hoidanit.laptopshop.service.CustomUserDetailsService;
import vn.hoidanit.laptopshop.service.UserService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    // @Bean
    // public AuthenticationManager authenticationManager(HttpSecurity httpSecurity,
    // PasswordEncoder passwordEncoder,
    // UserDetailsService userDetailsService) throws Exception {
    // AuthenticationManagerBuilder authenticationManagerBuilder = httpSecurity
    // .getSharedObject(AuthenticationManagerBuilder.class);
    // authenticationManagerBuilder
    // .userDetailsService(userDetailsService)
    // .passwordEncoder(passwordEncoder);

    // return authenticationManagerBuilder.build();
    // }
    @Bean
    public DaoAuthenticationProvider authProvider(PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        // authProvider.setHideUserNotFoundExceptions(false);

        return authProvider;
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(
                        auth -> auth
                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                        DispatcherType.INCLUDE)
                                .permitAll()
                                // trong spring security sẽ lưu ROLE_ADMIN/USER
                                .requestMatchers("/", "/login/**", "/product/**").permitAll()
                                // tự động bỏ ROLE_
                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                .anyRequest().authenticated())
                .formLogin(
                        formLogin -> formLogin
                                .loginPage("/login")
                                .failureUrl("/login?error")
                                .successHandler(customSuccessHandler())
                                .permitAll());
        return http.build();
    }
}
