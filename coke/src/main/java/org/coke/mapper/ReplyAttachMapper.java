package org.coke.mapper;

import java.util.List;

import org.coke.domain.ReplyAttachVO;

public interface ReplyAttachMapper {
	
	public void insert(ReplyAttachVO vo);
	
	public void deleteAll(long rno);
	
	public List<ReplyAttachVO> findByRno(long rno);
	
	public List<ReplyAttachVO> getOldReplyFiles();
	
	public void deleteFindBybno(long bno);

}
