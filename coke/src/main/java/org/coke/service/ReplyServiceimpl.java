package org.coke.service;

import java.util.List;

import org.coke.domain.Criteria;
import org.coke.domain.ReplyVO;
import org.coke.mapper.BoardAttachMapper;
import org.coke.mapper.BoardMapper;
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
	
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("**********************************");
		log.info("register : " + vo);
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);

		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			log.info("이미지 없음");
		}else {
			
			vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
			
			log.info("이미지 있음");
		}
				
		return mapper.insert(vo);
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
	

}
