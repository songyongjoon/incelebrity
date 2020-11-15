package com.spring.client.qna.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class QnaVO extends CommonVO{
    private int qna_no = 0;
    private String qna_title = "";
    private String qna_content = "";
    private String qna_writeday = "";
    private String qna_modday = "";
    private String qna_name = "";
    private int member_no = 0;
}