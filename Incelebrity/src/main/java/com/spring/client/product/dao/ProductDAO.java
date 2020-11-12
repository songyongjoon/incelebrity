package com.spring.client.product.dao;

import com.spring.client.product.vo.ProductVO;

import java.util.List;

public interface ProductDAO {
    public List<ProductVO> productList(ProductVO productVO);
}
