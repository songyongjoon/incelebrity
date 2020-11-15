package com.spring.client.product.dao;

import com.spring.common.vo.ProductDetailVO;
import com.spring.client.product.vo.ProductVO;

import java.util.List;

public interface ProductDAO {
    public List<ProductVO> productList(ProductVO productVO);
    public ProductVO productData(ProductVO productVO);
    public List<ProductDetailVO> productDetailData(ProductDetailVO productDetailVO);
}
