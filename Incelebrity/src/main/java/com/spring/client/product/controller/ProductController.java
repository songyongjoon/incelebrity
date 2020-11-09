package com.spring.client.product.controller;

import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.ProductVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProductController {
    private ProductService productService;

    @RequestMapping(value="/productList")
    public String productList(@ModelAttribute("data") ProductVO productVO, Model model){
        log.info("productList 호출 성공");

        List<ProductVO> productList = productService.productList(productVO);
        model.addAttribute("productList", productList);

        return "product/productList";
    }
}
