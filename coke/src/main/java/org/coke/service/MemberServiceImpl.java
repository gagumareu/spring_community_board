package org.coke.service;

import java.util.List;

import org.coke.domain.MemberVO;
import org.coke.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper memberMapper;
	
	
	@Override
	public List<MemberVO> getMemberList() {
		
		log.info("getMemberLIST");
		return memberMapper.getList();
	}
	
	

}
