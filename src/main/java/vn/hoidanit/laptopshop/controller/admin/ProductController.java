package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        model.addAttribute("productL", this.productService.getAllProduct());
        return "admin/product/table-product";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postSaveCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("avtFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }
        String fileImage = this.uploadService.handleSaveFile(file, "product");
        product.setImage(fileImage);
        this.productService.saveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product productById = this.productService.findProductById(id).get();
        model.addAttribute("productDetail", productById);
        return "admin/product/product-detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getEditProductPage(Model model, @PathVariable long id) {
        Product updateProduct = this.productService.findProductById(id).get();
        model.addAttribute("updateProduct", updateProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postEditProduct(Model model, @ModelAttribute("updateProduct") @Valid Product product,
            BindingResult bindingResult, @RequestParam("avtFile") MultipartFile multipartFile) {
        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product updateProduct = this.productService.findProductById(product.getId()).get();
        if (updateProduct != null) {
            updateProduct.setName(product.getName());
            updateProduct.setPrice(product.getPrice());
            updateProduct.setDetailDesc(product.getDetailDesc());
            updateProduct.setShortDesc(product.getShortDesc());
            updateProduct.setQuantity(product.getQuantity());
            updateProduct.setTarget(product.getTarget());
            updateProduct.setFactory(product.getFactory());
            updateProduct.setImage(this.uploadService.handleSaveFile(multipartFile, "product"));

            this.productService.saveProduct(updateProduct);
        }

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product deleteProduct = this.productService.findProductById(id).get();
        model.addAttribute("deleteProduct", deleteProduct);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("deleteProduct") Product product) {
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

}
