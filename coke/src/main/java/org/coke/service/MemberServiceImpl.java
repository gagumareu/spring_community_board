package org.coke.service;

import org.coke.domain.MemberVO;
import org.coke.mapper.MemberMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	private MemberMapper mapper;
		
	@Override
	public void signUpMember(MemberVO vo) {
		
		log.info("insert member");
		System.out.println("insert member");
		
		log.info("userpw: " + vo.getUserpw());
		
		
		mapper.insert(vo);
		
	}

}
