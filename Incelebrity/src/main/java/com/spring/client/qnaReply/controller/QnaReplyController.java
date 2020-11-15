package com.spring.client.qnaReply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.qnaReply.service.QnaReplyService;
import com.spring.client.qnaReply.vo.QnaReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/replies")
@Log4j
@AllArgsConstructor
public class QnaReplyController {
   private QnaReplyService qnaReplyService;
   
 
   @GetMapping(value = "/all/{qna_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})/*produces=MediaType.APPLICATION_JSON_UTF8_VALUE)*/
   public ResponseEntity<List<QnaReplyVO>> qnaReplyList(@PathVariable("qna_no") Integer qna_no){
      log.info("list 호출 성공");
      
      ResponseEntity<List<QnaReplyVO>> entity = null;
      entity = new ResponseEntity<>(qnaReplyService.qnaReplyList(qna_no), HttpStatus.OK);
      return entity;
   }
   
   @PostMapping(value = "/qnareplyInsert", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> qnareplyInsert(@RequestBody QnaReplyVO qvo){
      log.info("qnareplyInsert 호출 성공");
      log.info("QnaReplyVO : "+qvo);
      int result=0;
      
      result=qnaReplyService.qnareplyInsert(qvo);
      return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @GetMapping(value = "/{qna_reply_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<QnaReplyVO> qnareplySelect(@PathVariable("qna_reply_no") Integer qna_reply_no){
      log.info("QnaReplySelect 호출 성공");
      
      ResponseEntity<QnaReplyVO> entity = null;
      entity = new ResponseEntity<>(qnaReplyService.qnareplySelect(qna_reply_no), HttpStatus.OK);
      return entity;
   }
  
   @RequestMapping(value = "/{qna_reply_no}", method = {RequestMethod.PUT, RequestMethod.PATCH}, consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> qnareplyUpdate(@PathVariable("qna_reply_no") Integer qna_reply_no, @RequestBody QnaReplyVO qvo){
      log.info("qnareplyUpdate 호출 성공");
      
      qvo.setQna_reply_no(qna_reply_no);
      int result = qnaReplyService.qnareplyUpdate(qvo);
      return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @DeleteMapping(value = "/{qna_reply_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> qnareplyDelete(@PathVariable("qna_reply_no") Integer qna_reply_no){
      log.info("qnareplyDelete 호출 성공");
      log.info("qna_reply_no = " + qna_reply_no);
      
      int result = qnaReplyService.qnareplyDelete(qna_reply_no);
      return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
   }
   
}