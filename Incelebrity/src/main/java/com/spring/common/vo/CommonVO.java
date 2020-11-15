package com.spring.common.vo;

//import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@ToString
@Setter
@Getter
public class CommonVO {
	//조건 검색시 사용할 필드(검색대상, 검색단어)
	private String search = "";
	private String keyword = "";
	
	private int pageNum = 0;		//페이지번호
	private int amount = 0;			//페이지에 보여줄 데이터수
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;
    //검색 단어 필드
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
    // 제일 마지막 페이지 계산
    public void calcLastPage(int total, int cntPerPage) {
       setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }
    // 시작, 끝 페이지 계산
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
    // DB 쿼리에서 사용할 start, end값 계산
    public void calcStartEnd(int nowPage, int cntPerPage) {
       setEnd(nowPage * cntPerPage);
       setStart(getEnd() - cntPerPage + 1);
    }

}