package com.spring.common.vo;

<<<<<<< HEAD
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
=======
import lombok.Data;
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git

@Data
<<<<<<< HEAD
@AllArgsConstructor
=======
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git
public class CommonVO {
<<<<<<< HEAD

	// °Ë»ö Å°¿öµå ÇÊµå
=======
	private String page; // íŽ˜ì´ì§€ ë²ˆí˜¸
	private String pageSize; // íŽ˜ì´ì§€ì— ë³´ì—¬ì£¼ëŠ” ì¤„ ìˆ˜
	private String start_row; // ì‹œìž‘ ë ˆì½”ë“œ ë²ˆí˜¸
	private String end_row; // ì¢…ë£Œ ë ˆì½”ë“œ ë²ˆí˜¸

	// ì¡°ê±´ê²€ìƒ‰ì‹œ ì‚¬ìš©í•  í•„ë“œ
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git
	private String search = "";
	private String keyword = "";
<<<<<<< HEAD
	
	
	private int nowPage; // ÇöÀçÆäÀÌÁö
	private int startPage;// ½ÃÀÛÆäÀÌÁö
	private int endPage; // ³¡ÆäÀÌÁö
	private int total; // °Ô½Ã±Û ÃÑ °¹¼ö
	private int cntPerPage; // ÆäÀÌÁö´ç ±Û °¹¼ö
	private int lastPage; // ¸¶Áö¸·ÆäÀÌÁö
	private int start; // SQLÄõ¸®¿¡ ¾µ start
	private int end; // SQLÄõ¸®¿¡ ¾µ end
	private int cntPage=5;

	public CommonVO() {
	}

	public CommonVO(int total, int nowPage, int cntPerPage, String search, String keyword) {
		setSearch(search);
		setKeyword(keyword);
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// Á¦ÀÏ ¸¶Áö¸· ÆäÀÌÁö °è»ê
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// ½ÃÀÛ, ³¡ ÆäÀÌÁö °è»ê
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB Äõ¸®¿¡¼­ »ç¿ëÇÒ start, end°ª °è»ê
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
=======

	private int pageNum = 0;		//ï¿½ëŸ¹ï¿½ì” ï§žï¿½è¸°ëŠìƒ‡
	private int amount = 0;			//ï¿½ëŸ¹ï¿½ì” ï§žï¿½ï¿½ë¿‰ è¹‚ëŒë¿¬ä»¥ï¿½ ï¿½ëœ²ï¿½ì” ï¿½ê½£ï¿½ë‹”
	
	// ï¿½ì½ï¿½ì˜±ï¿½ëŸ¹ï¿½ì” ï§žï¿½, ï¿½ë–†ï¿½ì˜‰ï¿½ëŸ¹ï¿½ì” ï§žï¿½, ï¿½ê±¹ï¿½ëŸ¹ï¿½ì” ï§žï¿½, å¯ƒëš¯ë–†æ¹²ï¿½ ç¥ï¿½ åª›ï¿½ï¿½ë‹”, ï¿½ëŸ¹ï¿½ì” ï§žï¿½ï¿½ë–¦ æ¹²ï¿½ åª›ï¿½ï¿½ë‹”, ï§ë‰ï¿½ï§ë²ëŸ¹ï¿½ì” ï§žï¿½, SQLè‘ì‡°â”ï¿½ë¿‰ ï¿½ë² start, end
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;
    //å¯ƒï¿½ï¿½ê¹‹ ï¿½ë–’ï¿½ë¼± ï¿½ë¸˜ï¿½ë±¶
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
    // ï¿½ì £ï¿½ì”ª ï§ë‰ï¿½ï§ï¿½ ï¿½ëŸ¹ï¿½ì” ï§žï¿½ æ€¨ê¾©ê¶›
    public void calcLastPage(int total, int cntPerPage) {
       setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }
    // ï¿½ë–†ï¿½ì˜‰, ï¿½ê±¹ ï¿½ëŸ¹ï¿½ì” ï§žï¿½ æ€¨ê¾©ê¶›
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
    // DB è‘ì‡°â”ï¿½ë¿‰ï¿½ê½Œ ï¿½ê¶—ï¿½ìŠœï¿½ë¸· start, endåª›ï¿½ æ€¨ê¾©ê¶›
    public void calcStartEnd(int nowPage, int cntPerPage) {
       setEnd(nowPage * cntPerPage);
       setStart(getEnd() - cntPerPage + 1);
    }

	// ë‚ ì§œ ê²€ìƒ‰ì‹œ ì‚¬ìš©í•  í•„ë“œ
	private String start_date = "";
	private String end_date = "";
}
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git
