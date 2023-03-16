package org.coke.service;

import java.util.List;

import org.coke.domain.BoardVO;
import org.coke.mapper.ComputerMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class ComputerServiceImpl implements ComputerService{

	private ComputerMapper mapper;
		
	@Transactional
	@Override
	public void register(BoardVO vo) {
		
		log.info("regist: " + vo);
		
		mapper.insert(vo);
		
	}

	@Override
	public List<BoardVO> getListBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO getBoard(long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(long bno) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
