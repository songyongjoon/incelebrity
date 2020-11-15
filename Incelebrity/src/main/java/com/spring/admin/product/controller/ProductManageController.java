package com.spring.admin.product.controller;

import com.spring.admin.product.service.ProductManageService;
import com.spring.admin.product.vo.ProductManageVO;
import com.spring.common.vo.ProductDetailVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProductManageController {
    private ProductManageService productManageService;

    //글 목록 구현하기
    @RequestMapping(value="/productManageList", method = RequestMethod.GET)
    public String productManageList(@ModelAttribute("data") ProductManageVO pmvo, Model model){
        log.info("productManageList 호출 성공");

        List<ProductManageVO> productManageList = productManageService.productManageList(pmvo);
        model.addAttribute("productManageList", productManageList);

        return "product/productManageList";
    }

    //글 쓰기 폼 출력하기
    @RequestMapping(value="/productManageUpload")
    public String productManageUpload(@ModelAttribute("data") ProductManageVO pmvo){
        log.info("productManageUpload 호출 성공");

        return "product/productManageUpload";
    }

    //글 쓰기 구현
    @RequestMapping(value="/productManageInsert", method = RequestMethod.POST)
    public String productManageInsert(@ModelAttribute ProductManageVO pmvo, ProductDetailVO pdvo, Model model) throws Exception {
        log.info("productManageInsert 호출 성공");
        log.info("pmvo : " + pmvo);

        int result1 = 0;
        int result2 = 0;
        String url = "";

        result1 = productManageService.productManageInsert(pmvo);

        pdvo.setProduct_no(pmvo.getProduct_no());
        result2 = productManageService.productManageDetailInsert(pdvo);

        if(result1 == 1 && result2 == 1){
            url = "/product/productManageList";
        }

        return "redirect:" + url;
    }

    //글 상세보기 구현
    @RequestMapping(value="/productManageDetail", method = RequestMethod.GET)
    public String productManageDetail(@ModelAttribute("data") ProductManageVO pmvo, Model model){
        log.info("productManageDetail 호출 성공");
        log.info("bvo = " + pmvo);

        ProductManageVO detail = productManageService.productManageDetail(pmvo);
        model.addAttribute("detail", detail);

        return "product/productManageDetail";
    }
}