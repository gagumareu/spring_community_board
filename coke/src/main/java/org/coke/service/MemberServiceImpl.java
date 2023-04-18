package org.coke.service;

import org.coke.domain.AuthVO;
import org.coke.domain.MemberAttachVO;
import org.coke.domain.MemberVO;
import org.coke.mapper.MemberMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		log.info("userpw: " + vo.getUserpw());
		
		mapper.insert(vo);
		
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_USER");
		mapper.grantAuth(avo);
		
	}

	@Override
	public int checkId(String userid) {
		
		return mapper.checkDistinctId(userid);
	}
	
	
	@Override
	public MemberVO getMember(String userid) {
		
		return mapper.getuser(userid);
	}

	@Override
	public MemberVO readCustomUser(String userid) {
		
		return mapper.read(userid);
	}

	@Transactional
	@Override
	public boolean updateMember(MemberVO vo) {		
		
		if(vo.getUuid() != null && vo.getUploadPath() != null && vo.getFileName() != null) {
			mapper.deleteProfileImage(vo.getUserid());
			mapper.insertProfile(vo);
		}
		
		boolean result = mapper.update(vo) == 1;
		
		return result;
	}

	@Override
	public MemberAttachVO getUserAttach(String userid) {
		
		return mapper.getAttach(userid);
	}

	

	

	

}
