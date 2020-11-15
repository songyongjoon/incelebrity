package com.spring.client.product.service;

import com.spring.client.product.dao.ProductDAO;
import com.spring.common.vo.ProductDetailVO;
import com.spring.client.product.vo.ProductVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Setter(onMethod_=@Autowired)
    private ProductDAO productDAO;

    @Override
    public List<ProductVO> productList(ProductVO productVO) {
        List<ProductVO> result = null;
        result = productDAO.productList(productVO);

        return result;
    }

    @Override
    public ProductVO productData(ProductVO productVO) {
        ProductVO result = null;
        result = productDAO.productData(productVO);

        return result;
    }

    @Override
    public List<ProductDetailVO> productDetailData(ProductDetailVO productDetailVO) {
        List<ProductDetailVO> result = null;
        result = productDAO.productDetailData(productDetailVO);

        return result;
    }
}
