package com.phungnt.laptop_store.controller;

import com.phungnt.laptop_store.model.Product;
import com.phungnt.laptop_store.model.ProductDTO;
import com.phungnt.laptop_store.repository.ProductRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductRepository productRepository;

    @GetMapping({"","/"})
    public String showProductList(Model model){
        List<Product> products = productRepository.findAll();
        model.addAttribute("products",products);
        return "products/index";
    }

    @GetMapping("/create")
    public String showCreatePage(Model model){
        ProductDTO productDTO = new ProductDTO();
        model.addAttribute("productDTO",productDTO);
        return "products/CreateProduct";
    }
    @PostMapping("/create")
    public String createProduct(@Valid @ModelAttribute ProductDTO productDTO, BindingResult result){
        if(productDTO.getImageFile().isEmpty()){
            result.addError(new FieldError("productDTO", "imageFile",
                    "The image file is required"));
        }
        if(result.hasErrors()){
            return "products/CreateProduct";
        }

        MultipartFile image = productDTO.getImageFile();
        Date createdAt = new Date();
        String storageFileName = createdAt.getTime() + "_" + image.getOriginalFilename();
        try {
            String uploadDir = "public/images/";
            Path uploadPath  = Paths.get(uploadDir);
            if(!Files.exists(uploadPath)){
                Files.createDirectories(uploadPath);
            }
            try(InputStream inputStream = image.getInputStream()){
                Files.copy(inputStream, Paths.get(uploadDir + storageFileName),
                        StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (IOException e) {
            System.out.println("Exception: " +e.getMessage());
        }

        Product product = new Product();
        product.setName(productDTO.getName());
        product.setBrand(productDTO.getBrand());
        product.setCategory(productDTO.getCategory());
        product.setDescription(productDTO.getDescription());
        product.setPrice(productDTO.getPrice());
        product.setCreatedAt(createdAt);
        product.setImageFileName(storageFileName);

        productRepository.save(product);

        return "redirect:/products";
    }

    @GetMapping("/edit")
    public String showEditPage(Model model,@RequestParam int id){
        try {
            Product product = productRepository.findById(id).get();
            model.addAttribute("product",product);

            ProductDTO productDTO = new ProductDTO();
            productDTO.setName(product.getName());
            productDTO.setBrand(product.getBrand());
            productDTO.setCategory(product.getCategory());
            productDTO.setDescription(product.getDescription());
            productDTO.setPrice(product.getPrice());

            model.addAttribute("productDTO",productDTO);
        }catch (Exception e){
            System.out.println("Exception: " + e.getMessage());
            return "redirect:/products";
        }

        return "products/EditProduct";
    }

    @PostMapping("/edit")
    public String updateProduct(Model model, @RequestParam int id,
                                @Valid @ModelAttribute ProductDTO productDTO,
                                BindingResult result){
        try {
            Product product = productRepository.findById(id).get();
            model.addAttribute("product",product);

            if(result.hasErrors()){
                return "products/EditProduct";
            }

            if(!productDTO.getImageFile().isEmpty()){
                //delete old images
                String uploadDir = "public/images/";
                Path oldImage = Paths.get(uploadDir + product.getImageFileName());

                try {
                    Files.delete(oldImage);
                } catch (Exception e){
                    System.out.println("Exception: " + e.getMessage());
                }
                //add new
                MultipartFile image = productDTO.getImageFile();
                Date updateAt = new Date();
                String storageFileName = updateAt.getTime() + "_" + image.getOriginalFilename();
                try (InputStream inputStream =  image.getInputStream()){
                    Files.copy(inputStream, Paths.get(uploadDir + storageFileName),
                            StandardCopyOption.REPLACE_EXISTING);
                }
                product.setImageFileName(storageFileName);
            }
            product.setName(productDTO.getName());
            product.setBrand(productDTO.getBrand());
            product.setCategory(productDTO.getCategory());
            product.setPrice(productDTO.getPrice());
            product.setDescription(productDTO.getDescription());

            productRepository.save(product);
        }catch (Exception e){
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/products";
    }

    @GetMapping("/delete")
    public String deleteProdcut(@RequestParam int id){
        try {
          Product product = productRepository.findById(id).get();
          Path productImage = Paths.get("public/images/" + product.getImageFileName());
          try {
              Files.delete(productImage);
          } catch (Exception e){
              System.out.println("Exception: + " + e.getMessage());
          }

          productRepository.delete(product);
        } catch (Exception exception){
            System.out.println("Exception: " + exception.getMessage());
        }
        return "redirect:/products";
    }
}
