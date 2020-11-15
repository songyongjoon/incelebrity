package com.spring.admin.product.dao;

import com.spring.admin.product.vo.ProductManageVO;
import com.spring.common.vo.ProductDetailVO;

import java.util.List;

public interface ProductManageDAO {
    public List<ProductManageVO> productManageList(ProductManageVO pmvo);
    public int productManageNumber();
    public int productManageInsert(ProductManageVO pmvo);
    public int productManageDetailInsert(ProductDetailVO pdvo);
    public ProductManageVO productManageDetail(ProductManageVO pmvo);
}
