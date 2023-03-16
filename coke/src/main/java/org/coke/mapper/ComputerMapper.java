package org.coke.mapper;

import java.util.List;

import org.coke.domain.BoardVO;

public interface ComputerMapper {
	
	public void insert(BoardVO vo);
	
	public List<BoardVO> getList();
	
	public BoardVO get(long bno);
	
	public int delete(long bno);
	
	public int update(BoardVO vo);
	

}
