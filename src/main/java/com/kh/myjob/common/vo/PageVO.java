package com.kh.myjob.common.vo;

public class PageVO extends BaseSearchVO{
	private int nowPage; //현재선택된 페이지 번호
	private int totalCnt; //전체 데이터 수
	private int beginPage; //화면에 보이는 첫 페이지
	private int endPage; //화면에 보이는 마지막 페이지
	private int displayCnt; //한 화면에 보여지는 게시글 수
	private int displayPageCnt; //한 번에 보여지는 페이지 수
	private boolean prev; //이전 버튼의 유무
	private boolean next; //다음 버튼의 유무
	private int startNum; //시작 row_num
	private int endNum; //마지막 row_num
	
	
	public PageVO() {
		this.nowPage = 1;
		this.displayCnt = 10;
		this.displayPageCnt = 5;
	}

	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getDisplayCnt() {
		return displayCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum() {
		this.startNum = (nowPage - 1) * displayCnt + 1;
	}

	public int getEndNum() {
		return endNum;
	}
	public void setEndNum() {
		this.endNum = nowPage * displayCnt;
	}

	//페이징 처리의 모든 정보가 세팅.
	public void setPageInfo() {
		//화면에 보이는 마지막 페이지 번호를 설정
		this.endPage = (int)(Math.ceil(nowPage / (double)displayPageCnt)) * displayPageCnt;
		
		//화면에 보이는 첫 페이지 번호를 설정
		this.beginPage = endPage - displayPageCnt + 1;
		
		//전체 페이지 수
		int totalPage = (int)(Math.ceil(totalCnt / (double)displayCnt));
		
		//next 버튼의 유무
		if(endPage < totalPage) {
			next = true;
		}
		else {
			next = false;
			endPage = totalPage;
		}
		
		//prev 버튼의 유무
		prev = beginPage == 1 ? false : true;
		
		//rowNum 세팅
		setStartNum();
		setEndNum();
	}
}
