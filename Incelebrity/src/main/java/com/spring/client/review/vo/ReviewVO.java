package com.spring.client.review.vo;


import lombok.Data;

@Data
public class ReviewVO {
	private int review_no=0;
	private String review_title="";
	private String review_content="";
	private String review_writeday="";
	private String review_img="";
	private String review_point="";
	private String review_name="";
	private int orders_no =0;
}
