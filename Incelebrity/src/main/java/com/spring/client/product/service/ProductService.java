package com.spring.client.product.service;

import java.util.List;

import com.spring.client.product.vo.ProductVO;
import com.spring.common.vo.ProductDetailVO;

public interface ProductService {
    public List<ProductVO> productList(ProductVO productVO);
    public ProductVO productData(ProductVO productVO);
    public List<ProductDetailVO> productDetailData(ProductDetailVO productDetailVO);
}
