package com.spring.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailVO {
    private int product_detail_no = 0;
    private int product_detail_stock = 0;
    private String product_detail_color = "";
    private String product_detail_size = "";
    private String product_detail_writeDay = "";
    private String product_detail_modDay = "";
    private int product_no = 0;
}
