package org.coke.service;

import java.util.List;

import org.coke.domain.BoardVO;

public interface ComputerService {
	
	public void register(BoardVO vo);
	
	public List<BoardVO> getListBoard();
	
	public BoardVO getBoard(long bno);
	
	public boolean modify(BoardVO vo);
	
	public boolean remove(long bno);

}
