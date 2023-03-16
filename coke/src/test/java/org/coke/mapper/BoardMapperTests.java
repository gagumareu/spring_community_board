package org.coke.mapper;

import java.util.List;

import org.coke.domain.BoardVO;
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
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Test
	public void getListWithPage() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(20);
		
		List<BoardVO> list = boardMapper.getListWithPage(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSerch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("테스");
		cri.setType("TC");
		
		List<BoardVO> list = boardMapper.getListWithPage(cri);
		
		list.forEach(board -> log.info(board));
	}

}
