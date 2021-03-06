package com.kh.myjob.review.service;

import java.util.List;

import com.kh.myjob.review.vo.ReviewImgVO;
import com.kh.myjob.review.vo.ReviewRecomVO;
import com.kh.myjob.review.vo.ReviewReplyVO;
import com.kh.myjob.review.vo.ReviewVO;
import com.kh.myjob.review.vo.TagVO;

public interface ReviewService {
	
	
	//후기등록게시판 다음 코드조회
	String selectNextReviewBoardCode();
	
	//다음 이미지 코드 조회
	int selectNextReviewNumber();
	
	//후기등록
	void insertReview(ReviewVO reviewVO);
	
	//후기게시판 이미지등록
	void insertReviewImg(ReviewVO reviewVO);
	
	//후기게시판 리스트 조회
	List<ReviewVO> selectReviewList(ReviewVO reviewVO);
	
	//후기리스트 태그로 조회 
	List<ReviewVO> selectReviewListByTag(TagVO tagVO);
	
	//후기게시판 상세보기
	ReviewVO selectReviewDetail(ReviewVO reviewVO);
	
	//후기게시글 조회수증가
	void updateReadCnt(ReviewVO reviewVO);
	
	//후기게시글 삭제
	boolean deleteReviewBoard(ReviewVO reviewVO);
	
	//후기에 댓글등록
	int regReply(ReviewReplyVO reviewReplyVO);
	
	//후기게시판에 댓글목록 조회
	List<ReviewReplyVO> selectReviewReplyList(ReviewReplyVO reviewReplyVO);
	
	//후기게시판에 댓글삭제
	boolean deleteReviewReply(ReviewReplyVO reviewReplyVO);
	
	//총 게시글수
	int selectReviewCnt(ReviewVO reviewVO);
	
	//해당 게시판 댓글수
	int selectReplyCnt(ReviewReplyVO reviewReplyVO);
	
	//후기 게시판 추천수 증가
	int updateRecommendCnt(ReviewVO reviewVO);
	
	//후기 게시판 멤버 추가
	int insertRecomMember(ReviewRecomVO reviewRecomVO);
	
	//후기 게시판 멤버 조회
	ReviewRecomVO selectRecomMember(ReviewRecomVO reviewRecomVO);
	
	//메인페이지에 대표사진 5장 등록
	List<ReviewVO> selectMainImgName();
	
	//등록된 후기 코스코드 조회
	List<String> selectReviewListForCourseCode();
	
	//태그 등록 기능
	void insertTag(TagVO tagVO);
	//태그 조회 기능
	List<TagVO> selectTag(ReviewVO reviewVO); 
	
	//---------------아래는 관리자기능----------------//
	
	//총 댓글수
	int manageReplyCnt(ReviewReplyVO reviewReplyVO);

	//댓글 전체목록조회
	List<ReviewReplyVO> manageReplyList(ReviewReplyVO reviewReplyVO);
	
	//관리자 댓글 관리 댓글 상세조회
	ReviewReplyVO manageReplyDetail(String reviewReplyCode);
	
	
}
