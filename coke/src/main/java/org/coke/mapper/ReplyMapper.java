package org.coke.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.coke.domain.Criteria;
import org.coke.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(long rno);
	
	public int delete(long rno);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") long bno);
	
	public void  deleteAll(long bno);
}
