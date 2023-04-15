package org.coke.mapper;

import org.coke.domain.MemberVO;
import org.coke.security.domain.CustomUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.authentication.PasswordEncoderParser;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml", "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder; 
	
	@Test
	public void testRead() {
	
		MemberVO vo = mapper.read("admin90");
		
		log.info(vo);
		
		vo.getAuthList().forEach(auth -> log.info(auth));
		
	}
	
	@Test
	public void insermember() {
		
		MemberVO vo = new MemberVO();
		
		vo.setUserid("tester01");
		vo.setUserpw("te01");
		vo.setUserName("박테스터");
		
		mapper.insert(vo);
	}
	
	@Test
	public void readMember() {
		
		String user = "pizzatoday";
		
		MemberVO dto = mapper.read(user);
		
		CustomUser de =  new CustomUser(dto);
		
		log.info(dto);
		log.info(de);
		
	}
	
	@Test
	public void readMember2() {
		
		String user = "pizzatoday";
		
		MemberVO dto = mapper.getuser(user);
		
		
		
		log.info(dto.getUserid());
		log.info(dto.getUserName());
		log.info(dto.getRegDate());
	}
	

}
