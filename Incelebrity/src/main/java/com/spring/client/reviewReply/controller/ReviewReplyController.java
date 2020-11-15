package com.spring.client.reviewReply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.reviewReply.service.ReviewReplyService;
import com.spring.client.reviewReply.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reviewReply")
@Log4j
@AllArgsConstructor
public class ReviewReplyController {
	private ReviewReplyService replyService;
	/* ��� ��� �ҷ����� */
	@GetMapping(value="/all/{review_no}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<ReviewReplyVO>> reviewReplyList(@PathVariable("review_no") Integer review_no){
		ResponseEntity<List<ReviewReplyVO>> entity = null;
		
		entity = new ResponseEntity<>(replyService.reviewReplyList(review_no), HttpStatus.OK);
		return entity;
	}
	/*��� ��� ����*/
	@PostMapping(value="/replyInsert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> replyInsert(@RequestBody ReviewReplyVO rrvo){
		   log.info("replyInsert ȣ�� ����");
		   log.info("ReplyVO : " + rrvo);
		   int result = 0;
		   
		   result = replyService.replyInsert(rrvo);
		   return result==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		   
	   }
	
	 /* ���� �� ��� ���� ��ȸ */
	   @GetMapping(value="/{review_reply_no}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	   public ResponseEntity<ReviewReplyVO> replySelect(@PathVariable("review_reply_no") Integer review_reply_no){
		   log.info("replySelect ȣ�� ����");
		   
		   ResponseEntity<ReviewReplyVO> entity = null;
		   entity = new ResponseEntity<>(replyService.replySelect(review_reply_no), HttpStatus.OK);
		   return entity;
	   }
	   
	   /* ��� ���� ����*/
	   @RequestMapping(value="/{review_reply_no}", method= {RequestMethod.PUT, RequestMethod.PATCH}, consumes ="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> replyUpdate(@PathVariable("review_reply_no") Integer review_reply_no, @RequestBody ReviewReplyVO rrvo){
		   log.info("replyUpdate ȣ�� ����");
		   
		   rrvo.setReview_reply_no(review_reply_no);
		   int result = replyService.replyUpdate(rrvo);
		   return result ==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
		   					   new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	   /* ��� ���� ���� */
	   @DeleteMapping(value="/{review_reply_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> replyDelete(@PathVariable("review_reply_no") Integer review_reply_no){
		   log.info("replyDelete ȣ�� ����");
		   log.info("review_reply_no ="+review_reply_no);
		   
		   int result = replyService.replyDelete(review_reply_no);
		   return result==1 ?new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			   			     new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
}
