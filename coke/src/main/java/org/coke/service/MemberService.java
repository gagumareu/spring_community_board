package org.coke.service;

import org.coke.domain.MemberVO;

public interface MemberService {

	public void signUpMember(MemberVO vo);
	
	public int checkId(String userid);
	
	public MemberVO getMember(String userid);
	
	public MemberVO readCustomUser(String userid);
}
