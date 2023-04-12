package org.coke.mapper;

import org.coke.domain.AuthVO;
import org.coke.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insert(MemberVO vo);
	
	public void grantAuth(AuthVO avo);
	
	public int checkDistinctId(String userid);
	
}
