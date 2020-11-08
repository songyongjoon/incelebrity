package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

/**************************************************************
 * 참고 : REST(Representational State Transfer)의 약어로 
 *      하나의 URI는 하나의 고유한 리소스를 대표하도록 설계된다는 개념이다. 
 *      즉 REST방식은 특정 URL는 반드시 그에 상응하는 데이터 자체라는 것을 의미하는 방식이다. 
 *      예를 들어 'board/125'은 게시물 중에서 125번이라는 고유한 의미를 가지도록 설계하고, 
 *      이에 대한 처리는 GET, POST 방식과 같이 추가적인 정보를 통해서 결정한다.
 **************************************************************/

/**************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody)
 * Controller가 REST 방식을 처리하기 위한 것임을 명시. (기존의 특정한 JSP와 같은 뷰를 만들어 
 * 내는 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 * @ResponesBody: 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도이다.
 * @PathVariable: URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용한다.
 * @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.
 * @PostMapping, @GetMapping, @RequestMapping 어노테이션에서 
 * consumes 속성을 이용하면 사용자가 Request Body에 담는 타입을 제한할 수 있으며 
 * 요청시 헤더에 반드시 application/json이 존재해야 한다.
 * produces 속성을 추가하고 dataType을 지정하면 해당 데이터타입으로만 
 * 사용자에게 응답하겠다는 의미로 해석하면 된다.
 **************************************************************/
@RestController
@RequestMapping(value="/replies")
@Log4j
@AllArgsConstructor
public class ReplyController {
   private ReplyService replyService;
   
   /**************************************************************
    * 댓글 글목록 구현하기
    * @return List<ReplyVO>
    * 참고: @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
    * 현재 요청 URL: http://localhost:8080/replies/all/게시판글번호
    * 예전 요청 URL: http://localhost:8080/replies/replyList?b_num=게시판글번호
    * ResponseEntity는 개발자가 직접 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스.
    **************************************************************/
   @GetMapping(value = "/all/{b_num}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})/*produces=MediaType.APPLICATION_JSON_UTF8_VALUE)*/
   public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num){
      log.info("list 호출 성공");
      
      ResponseEntity<List<ReplyVO>> entity = null;
      entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK);
      return entity;
   }
   
   
   /**************************************************************
    * 댓글 글쓰기 구현하기
    * @return String
    * 참고: @RequestBody
    **************************************************************/
   @PostMapping(value = "/replyInsert", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
      log.info("replyInsert 호출 성공");
      log.info("ReplyVO : "+rvo);
      int result=0;
      
      result=replyService.replyInsert(rvo);
      return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   
   /**************************************************************
    * 수정 전 댓글 정보 조회하기
    * @return ReplyVO
    **************************************************************/
   @GetMapping(value = "/{r_num}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<ReplyVO> replySelect(@PathVariable("r_num") Integer r_num){
      log.info("replySelect 호출 성공");
      
      ResponseEntity<ReplyVO> entity = null;
      entity = new ResponseEntity<>(replyService.replySelect(r_num), HttpStatus.OK);
      return entity;
   }
   
   
   /**************************************************************
    * 댓글 비밀번호 확인
    * @return String
    * 참고: @RequestBody
    **************************************************************/
   @RequestMapping(value="/pwdConfirm")
   public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReplyVO rvo){
      log.info("pwdConfirm 호출 성공");
      
      ResponseEntity<Integer> entity = null;
      int result = 0;
      
      result = replyService.pwdConfirm(rvo);
      entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
      return entity;
   }
   
   
   /**************************************************************
    * 댓글 수정 구현하기
    * @return
    * 참고: REST 방식에서 UPDATE 작업은 PUT, PATCH 방식응ㄹ 이용해서 처리.
    * 전체 데이터를 수정하는 경우에는 PUT을 이용하고, 일부의 데이터를 수정하는 경우에는 PATCH를 이용.
    **************************************************************/
   @RequestMapping(value = "/{r_num}", method = {RequestMethod.PUT, RequestMethod.PATCH}, consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> replyUpdate(@PathVariable("r_num") Integer r_num, @RequestBody ReplyVO rvo){
      log.info("replyUpdate 호출 성공");
      
      rvo.setR_num(r_num);
      int result = replyService.replyUpdate(rvo);
      return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   
   /**************************************************************
    * 댓글 삭제 구현하기
    * @return
    * 참고: REST 방식에서 DELETE 작업은 DELETE 방식을 이용해서 처리.
    **************************************************************/
   /*
   @RequestMapping(value = "{r_num}", method = RequestMethod.DELETE, produces = {MediaType.TEXT_PLAIN_VALUE})
    */
   @DeleteMapping(value = "/{r_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> replyDelete(@PathVariable("r_num") Integer r_num){
      log.info("replyDelete 호출 성공");
      log.info("r_num = " + r_num);
      
      int result = replyService.replyDelete(r_num);
      return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
   }
   
}