package vn.hoidanit.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import vn.hoidanit.laptopshop.service.validator.StrongPassword;
import jakarta.validation.constraints.*;

@Getter
@Setter
@ToString
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Email cannot be empty")
    @Email
    @Email(message = "Email is not valid", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?^{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @Size(min = 8, message = "Password must be have at least 8 digits")
    @NotNull
    @StrongPassword(message = "hehe")
    private String password;

    @NotNull
    @Size(min = 6, message = "FullName must be have at least 6 digits")
    private String fullName;
    private String address;
    private String phone;
    private String avatar;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @OneToMany(mappedBy = "user")
    private List<Order> orderList;
}
