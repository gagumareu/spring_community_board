package org.coke.mapper;

import org.coke.domain.AuthVO;
import org.coke.domain.MemberAttachVO;
import org.coke.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insert(MemberVO vo);
	
	public void grantAuth(AuthVO avo);
	
	public int checkDistinctId(String userid);
	
	public MemberVO getuser(String userid);
	
	public void insertProfile(MemberVO vo);
	
	public int update(MemberVO vo);
	
	public void deleteProfileImage(String userid);
	
	public MemberAttachVO getAttach(String userid);
	
}
