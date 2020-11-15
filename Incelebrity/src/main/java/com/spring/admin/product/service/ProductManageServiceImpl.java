package com.spring.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.admin.product.dao.ImageDAO;
import com.spring.admin.product.dao.ProductManageDAO;
import com.spring.admin.product.vo.ProductManageVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.common.vo.ImageVO;
import com.spring.common.vo.ProductDetailVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ProductManageServiceImpl implements ProductManageService {
    @Setter(onMethod_=@Autowired)
    private ProductManageDAO productManageDAO;

    @Setter(onMethod_=@Autowired)
    private ImageDAO imageDAO;

    //湲� 紐⑸줉 援ы쁽
    @Override
    public List<ProductManageVO> productManageList(ProductManageVO pmvo) {
        List<ProductManageVO> list = null;
        list = productManageDAO.productManageList(pmvo);

        return list;
    }

    //湲� �엯�젰 援ы쁽
    @Transactional
    @Override
    public int productManageInsert(ProductManageVO pmvo) throws Exception {
        int result1 = 0;
        int result2 = 0;
        ImageVO ivo = null;

        pmvo.setProduct_list_img(FileUploadUtil.fileUpload(pmvo.getList_images(), "listImg"));
        List<String> fileName = FileUploadUtil.multipleFileUpload(pmvo.getImages().get(0).getFiles(), "contentImg");

        if(!fileName.isEmpty()){
            pmvo.setProduct_no(productManageDAO.productManageNumber());
            result1 = productManageDAO.productManageInsert(pmvo);
            pmvo.getImages().clear();

            for(int i=0; i<fileName.size(); i++){
                ivo = new ImageVO();
                ivo.setProduct_no(pmvo.getProduct_no());
                ivo.setImage_file(fileName.get(i));
                pmvo.getImages().add(ivo);
            }

            result2 = imageDAO.multipleImageInsert(pmvo.getImages());
        }

        return result1 * result2;
    }

    @Override
    public int productManageDetailInsert(ProductDetailVO pdvo) {
        int result = 0;
        result = productManageDAO.productManageDetailInsert(pdvo);

        return result;
    }

    //湲� �긽�꽭 援ы쁽
    @Override
    public ProductManageVO productManageDetail(ProductManageVO pmvo) {
        ProductManageVO detail = null;
        detail = productManageDAO.productManageDetail(pmvo);

        if(detail != null){
            detail.setProduct_content(detail.getProduct_content().toString().replaceAll("\n", "<br>"));
        }

        return detail;
    }
}
