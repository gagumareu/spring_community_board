package org.coke.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MeberControllerTest {
	
	private MockMvc mvc;
	
	
	@Test
	public void insert() throws Exception{
		
		String result = 
				mvc.perform(MockMvcRequestBuilders.get("/signUp")
						.param("userid", "ttttt")
						.param("userpw", "tt00")
						.param("username", "testertttttt"))
				.andReturn().getModelAndView().getViewName()
				;
		
		log.info(result);
		
	}
	

}
