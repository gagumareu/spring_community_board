package org.coke.mapper;

import java.util.List;

import org.coke.domain.BoardVO;
import org.coke.domain.Criteria;
import org.coke.domain.ReplyAttachVO;
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
	
	@Setter(onMethod_ = @Autowired)
	private ReplyAttachMapper replyAttachMapper;
	
	@Test
	public void getListWithPage() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
//		cri.setBsort("음악");
		cri.setBtag("컴퓨터");
		
		List<BoardVO> list = boardMapper.getListWithPage(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSerch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("내가");
		cri.setType("T");
		cri.setPageNum(2);
		cri.setAmount(10);
		//cri.setBsort("컴퓨터");
		
		List<BoardVO> list = boardMapper.getListWithPage(cri);
		
		list.forEach(board -> log.info(board));
	}

	@Test
	public void getTotalCount() {
		
		Criteria cri = new Criteria();
		
		//cri.setBsort("음악");
		
		int total = boardMapper.getTotal(cri);
		
		log.info(total);
		
	}
	
	@Test
	public void getSortList() {
		
		Criteria cri = new Criteria();
		cri.setBtag("주변기기");
		
		List<BoardVO> list = boardMapper.getListWithPage(cri);
		
		list.forEach(tag -> log.info(tag));
	}
	
	@Test
	public void getTagList() {
		
		Criteria cri = new Criteria();
		cri.setBtag("컴퓨터");
		
		List<String> list = boardMapper.getTagList(cri);
		
		list.forEach(tag -> log.info(tag));
	}
	
	
	@Test
	public void replyAttach() {
		
		ReplyAttachVO vo = new ReplyAttachVO();
				
		vo.setFileName("test2");
		vo.setFileType(true);
		vo.setRno(635);
		vo.setUploadPath("test2");
		vo.setUuid("test2");
		log.info(vo);
		replyAttachMapper.insert(vo);
		
	}
	
	@Test
	public void deleteReplyAttach() {
		
		ReplyAttachVO vo = new ReplyAttachVO();
		
		vo.setRno(692);
		
		replyAttachMapper.deleteAll(vo.getRno());
	}
	
	@Test
	public void getTopwriter() {
		
		boardMapper.getTopwriter();
	}
	
	
	
}
