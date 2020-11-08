package com.spring.client.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
    private int product_no = 0;
    private String product_name = "";
    private int product_price = 0;
    private String product_list_img = "";
    private String product_content_img = "";
    private String product_content = "";
}
