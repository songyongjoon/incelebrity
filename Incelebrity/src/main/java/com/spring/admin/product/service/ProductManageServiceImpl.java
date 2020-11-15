package com.spring.admin.product.service;

import com.spring.admin.product.dao.ImageDAO;
import com.spring.admin.product.dao.ProductManageDAO;
import com.spring.admin.product.vo.ProductManageVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.common.vo.ImageVO;
import com.spring.common.vo.ProductDetailVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductManageServiceImpl implements ProductManageService {
    @Setter(onMethod_=@Autowired)
    private ProductManageDAO productManageDAO;

    @Setter(onMethod_=@Autowired)
    private ImageDAO imageDAO;

    //글 목록 구현
    @Override
    public List<ProductManageVO> productManageList(ProductManageVO pmvo) {
        List<ProductManageVO> list = null;
        list = productManageDAO.productManageList(pmvo);

        return list;
    }

    //글 입력 구현
    @Transactional
    @Override
    public int productManageInsert(ProductManageVO pmvo) throws Exception {
        int result1 = 0;
        int result2 = 0;
        ImageVO ivo = null;

        pmvo.setProduct_list_img(FileUploadUtil.fileUpload(pmvo.getList_image(), "listImg"));
        pmvo.setProduct_content_img(FileUploadUtil.fileUpload(pmvo.getContent_image(), "contentImg"));
        List<String> fileName = FileUploadUtil.multipleFileUpload(pmvo.getImages().get(0).getFiles(), "images");

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

    //글 상세 구현
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
