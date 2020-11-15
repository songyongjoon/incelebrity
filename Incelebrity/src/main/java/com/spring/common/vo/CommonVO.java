package com.spring.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String page; // ÆäÀÌÁö ¹øÈ£
	private String pageSize; // ÆäÀÌÁö¿¡ º¸¿©ÁÖ´Â ÁÙ ¼ö
	private String start_row; // ½ÃÀÛ ·¹ÄÚµå ¹øÈ£
	private String end_row; // Á¾·á ·¹ÄÚµå ¹øÈ£

	// Á¶°Ç°Ë»ö½Ã »ç¿ëÇÒ ÇÊµå
	private String search = "";
	private String keyword = "";
	
<<<<<<< HEAD
	private int pageNum = 0;		//í˜ì´ì§€ë²ˆí˜¸
	private int amount = 0;			//í˜ì´ì§€ì— ë³´ì—¬ì¤„ ë°ì´í„°ìˆ˜
	
	// í˜„ì¬í˜ì´ì§€, ì‹œì‘í˜ì´ì§€, ëí˜ì´ì§€, ê²Œì‹œê¸€ ì´ ê°¯ìˆ˜, í˜ì´ì§€ë‹¹ ê¸€ ê°¯ìˆ˜, ë§ˆì§€ë§‰í˜ì´ì§€, SQLì¿¼ë¦¬ì— ì“¸ start, end
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;
    //ê²€ìƒ‰ ë‹¨ì–´ í•„ë“œ
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
    // ì œì¼ ë§ˆì§€ë§‰ í˜ì´ì§€ ê³„ì‚°
    public void calcLastPage(int total, int cntPerPage) {
       setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }
    // ì‹œì‘, ë í˜ì´ì§€ ê³„ì‚°
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
    // DB ì¿¼ë¦¬ì—ì„œ ì‚¬ìš©í•  start, endê°’ ê³„ì‚°
    public void calcStartEnd(int nowPage, int cntPerPage) {
       setEnd(nowPage * cntPerPage);
       setStart(getEnd() - cntPerPage + 1);
    }
=======
>>>>>>> branch 'master' of https://github.com/songyongjoon/incelebrity.git

<<<<<<< HEAD
}
=======
	// ³¯Â¥ °Ë»ö½Ã »ç¿ëÇÒ ÇÊµå
	private String start_date = "";
	private String end_date = "";
}
>>>>>>> branch 'master' of https://github.com/songyongjoon/incelebrity.git
