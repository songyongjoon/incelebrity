package com.spring.common.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
public class ImageVO {
    private int image_no = 0;
    private int product_no = 0;
    private List<MultipartFile> files; //파일 업로드를 위한 필드
    private String image_file = ""; //실제 서버에 저장한 파일명(복수파일)
    private String image_writeday = "";

    public ImageVO(){
        files = new ArrayList<MultipartFile>();
    }
}