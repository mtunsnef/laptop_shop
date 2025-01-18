package vn.hoidanit.laptopshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Mật khẩu xác nhận không hợp")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        // check password pattern
        String password = user.getPassword();
        String passwordPattern = "^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?\":{}|<>])(?=.{6,}).*$"; // Kiểm tra tất cả các yêu cầu
        if (password != null && !password.matches(passwordPattern)) {
            context.buildConstraintViolationWithTemplate(
                    "Password phải có ít nhất 6 ký tự, 1 ký tự viết hoa và 1 ký tự đặc biệt")
                    .addPropertyNode("password") // Chỉ định lỗi cho trường 'password'
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        // check email not null
        if (user.getEmail() == null || user.getEmail().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Email không được để trống")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        // check exist email
        if (this.userService.checkEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // check first name not null
        if (user.getFirstName() == null || user.getFirstName().isEmpty()) {
            context.buildConstraintViolationWithTemplate("First Name không được để trống")
                    .addPropertyNode("firstName")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        // check last name not null
        if (user.getLastName() == null || user.getLastName().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Last Name không được để trống")
                    .addPropertyNode("lastName")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
