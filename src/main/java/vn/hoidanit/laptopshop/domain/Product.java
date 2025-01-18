package vn.hoidanit.laptopshop.domain;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Price must be greater than 0")
    private double price;

    @NotEmpty(message = "Product Name can not be blank")
    private String name;
    private String image;

    @NotEmpty(message = "Detail description can not be blank")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    private String shortDesc;
    @Min(value = 1, message = "Quantity must be greater than 0")
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetailList;
}
