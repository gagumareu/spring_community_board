package org.coke.mapper;

import java.util.List;

import org.coke.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(long bno);
	
	public void deleteAll(long bno);
	
	public List<BoardAttachVO> getOldFiles();

}
