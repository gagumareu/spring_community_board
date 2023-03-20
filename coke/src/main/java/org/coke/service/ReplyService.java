package org.coke.service;

import java.util.List;

import org.coke.domain.Criteria;
import org.coke.domain.ReplyAttachVO;
import org.coke.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(long rno);
	
	public int remove(long rno);
	
	public int modify(ReplyVO vo);
	
	public List<ReplyVO> getList(Criteria cri, long bno);
	
	public List<ReplyAttachVO> getAttachList(long rno);
}
