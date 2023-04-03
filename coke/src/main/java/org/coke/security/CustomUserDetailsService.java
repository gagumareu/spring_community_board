package org.coke.security;

import org.coke.domain.MemberVO;
import org.coke.mapper.MemberMapper;
import org.coke.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("userId: " + username);
		
		MemberVO vo = mapper.read(username);
		
		log.warn("query by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
