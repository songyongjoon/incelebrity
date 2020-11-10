package com.spring.client.product.controller;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.ProductDetailVO;
import com.spring.client.product.vo.ProductVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping(value="/productDetail")
    public String productDetail(@ModelAttribute("data") ProductVO productVO, ProductDetailVO productDetailVO, Model model, HttpSession session){
        log.info("productDetail 호출 성공");

        String url = "";
        MemberVO member_no = null;

        member_no = (MemberVO)session.getAttribute("loginMember");

        if(member_no != null){
            ProductVO productData = productService.productData(productVO);
            List<ProductDetailVO> productDetailData = productService.productDetailData(productDetailVO);
            model.addAttribute("productData", productData);
            model.addAttribute("productDetailData", productDetailData);
            log.info("detail : " + productData);
            log.info("detail : " + productDetailData);
            url = "product/productDetail";
        }
        else{
            url = "redirect:/product/productList";
        }

        return url;
    }
}
