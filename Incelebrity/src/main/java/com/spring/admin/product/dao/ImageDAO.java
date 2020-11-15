package com.spring.admin.product.dao;

import com.spring.common.vo.ImageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ImageDAO {
    public List<ImageVO> imageList(ImageVO ivo);
    public int multipleImageInsert(@Param("images") List<ImageVO> images);
}