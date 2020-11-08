package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDAO;
import com.spring.client.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

   @Setter(onMethod_ = @Autowired)
   private ReplyDAO replyDAO;
      
   //글 목록 구현
   @Override
   public List<ReplyVO> replyList(int b_num){
      List<ReplyVO> list = null;
      list = replyDAO.replyList(b_num);
      return list;
   }
   
   //글 입력 구현
   @Override
   public int replyInsert(ReplyVO rvo) {
      int result = 0;
      try {
         result = replyDAO.replyInsert(rvo);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
   
   //비밀번호 확인 구현
   @Override
   public int pwdConfirm(ReplyVO rvo) {
      int result = 0;
      result = replyDAO.pwdConfirm(rvo);
            return result;
   }
   
   //수정 전 레코드 조회
   @Override
   public ReplyVO replySelect(Integer r_num) {
      ReplyVO rvo = null;
      rvo = replyDAO.replySelect(r_num);
      return rvo;
   }
   
   //글 수정 구현
   @Override
   public int replyUpdate(ReplyVO rvo) {
      int result = 0;
      try {
         result = replyDAO.replyUpdate(rvo);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
   
   @Override
   public int replyDelete(Integer r_num) {
      int result = 0;
      try {
         result = replyDAO.replyDelete(r_num);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }
}