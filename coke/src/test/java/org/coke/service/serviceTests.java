package org.coke.service;

import org.coke.domain.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class serviceTests {

	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
//	@Test
//	public void list() {
//		empService.getEmpList().forEach(emp -> log.info(emp));;
//		
//	}
	
//	@Test
//	public void register() {
//		
//		EmpVO empVO = new EmpVO();
//		
//		empVO.setAddr("ssss");
//		empVO.setDepartno(1);
//		empVO.setEmail("123@email.com");
//		empVO.setName("tester");
//		empVO.setPhone("010-23232-2323");
//
//		empService.registerEmp(empVO);
//		log.info("새로 생성된 emp: " + empVO.getEmail());
//	}
	
	@Test
	public void boardList() {
//		boardService.getBoardList().forEach(board -> log.info(board));
		
		boardService.getBoardList(new Criteria(2, 20)).forEach(board -> log.info(board));
	}
	
	
}
