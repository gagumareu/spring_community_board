package org.coke.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.coke.domain.Criteria;
import org.coke.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	private Long[] bnoArr = { 1048576L, 1048575L, 1048574L, 1048573L, 1048572L };
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
//	@Test
//	public void createTest() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			ReplyVO vo = new ReplyVO();
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트" + i);
//			vo.setReplyer("replyer" + i);
//			
//			mapper.insert(vo);
//		});
//	}
//	
//	@Test
//	public void readTest() {
//		
//		Long targetNum = 10L;
//		
//		ReplyVO vo = mapper.read(targetNum);
//		
//		log.info(vo);
//	}
	
//	@Test
//	public void deleteTest() {
//		
//		long targetNum = 10L;
//		
//		mapper.delete(targetNum);
//		
//	}
	
//	@Test
//	public void updateTest() {
//		
//		long targetNum = 39;
//		
//		ReplyVO vo = mapper.read(targetNum);
//		
//		vo.setReply("댓글 수정" );
//		
//		int count = mapper.update(vo);
//		
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testList() {
//		
//		Criteria cri = new Criteria();
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
//		
//		replies.forEach(reply -> log.info(replies));
//	}
	
	@Test
	public void testList2() {
		
		log.info("tstList2");
		
		Criteria cri = new Criteria(2, 10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1048641L);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	
	
}
