package com.spring.client.qna.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
//@AllArgsConstructor
//@NoArgsConstructor
public class QnaVO {
    private int qna_no = 0;
    private String qna_title = "";
    private String qna_content = "";
    private String qna_writeday = "";
    private String qna_modday = "";
    private String qna_name = "";
}

