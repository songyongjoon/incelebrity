package com.spring.admin.product.vo;

import com.spring.common.vo.CommonVO;
import com.spring.common.vo.ImageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductManageVO extends CommonVO {
    private int product_no = 0;
    private String product_name = "";
    private int product_price = 0;
    private String product_list_img = "";
    private String product_content_img = "";
    private List<ImageVO> images;
    private String product_content = "";
    private MultipartFile list_image;
    private MultipartFile content_image;

    public ProductManageVO(){
        images = new ArrayList<ImageVO>();
    }
}
