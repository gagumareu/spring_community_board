package org.coke.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.coke.domain.MemberAttachVO;
import org.coke.domain.MemberVO;
import org.coke.service.BoardService;
import org.coke.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@AllArgsConstructor
@Log4j
public class MyPageController {
	
	private BoardService boardService;
	
	private MemberService memberService;
	
	private void deleteFile(MemberAttachVO vo) {
		
		if(vo == null) {
			return;
		}
		
		log.info("delete user attach file");
		
		try {
			
			Path file = Paths.get("C:\\workspace\\upload\\profile\\" + vo.getUploadPath() +"\\"+ vo.getUuid() +"_"+ vo.getFileName());
			
			Files.deleteIfExists(file);
			
		} catch (Exception e) {
			log.error("delete file error" + e.getMessage());
		}
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/main")
	public void myPage(Model model, @RequestParam("userid") String userid) {
		
		log.info("-----------------------------");
		log.info("my page");
		log.info("param id: " + userid);
		
		MemberVO vo = memberService.getMember(userid);
		
		MemberVO vo2 = memberService.readCustomUser(userid);
		
		
		log.info("memberVO: " + vo);
		log.info("customUser: " + vo2);
		
		model.addAttribute("memberDto", vo);
		
		model.addAttribute("topwriterList", boardService.getTowriterList());
		model.addAttribute("mostViewList", boardService.getViewList());
		model.addAttribute("mostReplyList", boardService.getMostReplyList());
	}
	
	@PreAuthorize("principal.username == #vo.userid")
	@PostMapping("/update")
	public String updateUser(MemberVO vo, RedirectAttributes rttr) {
		
		log.info("-------------------");
		log.info("member update");
		log.info(vo);
		vo.setFileType(true);
		
		if(memberService.updateMember(vo)) {
			rttr.addFlashAttribute("result", "success");
		
		}
		
		rttr.addAttribute("userid", vo.getUserid());
		
		return "redirect:/myPage/main";
	}
	
	@GetMapping(value = "/getUserAttach", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<MemberAttachVO> getUserAttach(String userid){
		
		log.info("get attach by memberControll: " + userid);
		
		return new ResponseEntity<>(memberService.getUserAttach(userid), HttpStatus.OK);
	}
	
	
	
	
	

}
