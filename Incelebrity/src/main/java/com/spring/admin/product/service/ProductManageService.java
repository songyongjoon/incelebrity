package com.spring.admin.product.service;

import com.spring.admin.product.vo.ProductManageVO;
import com.spring.common.vo.ProductDetailVO;

import java.util.List;

public interface ProductManageService {
    public List<ProductManageVO> productManageList(ProductManageVO pmvo);
    public int productManageInsert(ProductManageVO pmvo) throws Exception;
    public int productManageDetailInsert(ProductDetailVO pdvo);
    public ProductManageVO productManageDetail(ProductManageVO pmvo);
}
