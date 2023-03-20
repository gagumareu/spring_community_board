package org.coke.service;

import java.util.List;

import org.coke.domain.Criteria;
import org.coke.domain.ReplyAttachVO;
import org.coke.domain.ReplyVO;
import org.coke.mapper.BoardAttachMapper;
import org.coke.mapper.BoardMapper;
import org.coke.mapper.ReplyAttachMapper;
import org.coke.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceimpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)	
	private ReplyAttachMapper replyAttachMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		
		log.info("**********************************");
		log.info("register : " + vo);
	
		boardMapper.updateReplyCnt(vo.getBno(), 1);

		int count = mapper.insert(vo);
		
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			System.out.println("첨부 파일 없음");
		}
		
		vo.getAttachList().forEach(attach ->{
			attach.setRno(vo.getRno());
			replyAttachMapper.insert(attach);
		});
		
		return count;
	}

	@Override
	public ReplyVO get(long rno) {
		log.info("get : " + rno);
		return mapper.read(rno);
	}
	
	@Transactional
	@Override
	public int remove(long rno) {
		log.info("remove : " + rno);
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		replyAttachMapper.deleteAll(rno);
	
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify " + vo);
		return mapper.update(vo);
	}


	@Override
	public List<ReplyVO> getList(Criteria cri, long bno) {
		log.info("getList : " +bno );
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public List<ReplyAttachVO> getAttachList(long rno) {
		log.info("findByRno rno: " + rno);
		return replyAttachMapper.findByRno(rno);
	}
	

}
