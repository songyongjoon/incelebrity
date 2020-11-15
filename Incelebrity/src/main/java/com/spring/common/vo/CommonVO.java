package com.spring.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 줄 수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	private int pageNum = 0;		//�럹�씠吏�踰덊샇
	private int amount = 0;			//�럹�씠吏��뿉 蹂댁뿬以� �뜲�씠�꽣�닔
	
	// �쁽�옱�럹�씠吏�, �떆�옉�럹�씠吏�, �걹�럹�씠吏�, 寃뚯떆湲� 珥� 媛��닔, �럹�씠吏��떦 湲� 媛��닔, 留덉�留됲럹�씠吏�, SQL荑쇰━�뿉 �벝 start, end
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;
    //寃��깋 �떒�뼱 �븘�뱶
    private String profitStart = "";
    private String profitEnd = "";
    private int profitTotal;
    
    public CommonVO() {
    }
    public CommonVO(int total, int nowPage, int cntPerPage, String profitStart, String profitEnd) {
       setNowPage(nowPage);
       setCntPerPage(cntPerPage);
       setTotal(total);
       calcLastPage(getTotal(), getCntPerPage());
       calcStartEndPage(getNowPage(), cntPage);
       calcStartEnd(getNowPage(), getCntPerPage());
    }
    // �젣�씪 留덉�留� �럹�씠吏� 怨꾩궛
    public void calcLastPage(int total, int cntPerPage) {
       setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }
    // �떆�옉, �걹 �럹�씠吏� 怨꾩궛
    public void calcStartEndPage(int nowPage, int cntPage) {
       setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
       if (getLastPage() < getEndPage()) {
          setEndPage(getLastPage());
       }
       setStartPage(getEndPage() - cntPage + 1);
       if (getStartPage() < 1) {
          setStartPage(1);
       }
    }
    // DB 荑쇰━�뿉�꽌 �궗�슜�븷 start, end媛� 怨꾩궛
    public void calcStartEnd(int nowPage, int cntPerPage) {
       setEnd(nowPage * cntPerPage);
       setStart(getEnd() - cntPerPage + 1);
    }

	// 날짜 검색시 사용할 필드
	private String start_date = "";
	private String end_date = "";
}
