package com.phungnt.laptop_store.repository;

import com.phungnt.laptop_store.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}
