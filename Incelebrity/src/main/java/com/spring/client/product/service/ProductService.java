package com.spring.client.product.service;

import com.spring.client.product.vo.ProductDetailVO;
import com.spring.client.product.vo.ProductVO;

import java.util.List;

public interface ProductService {
    public List<ProductVO> productList(ProductVO productVO);
    public ProductVO productData(ProductVO productVO);
    public List<ProductDetailVO> productDetailData(ProductDetailVO productDetailVO);
}
