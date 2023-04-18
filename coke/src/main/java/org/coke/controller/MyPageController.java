package org.coke.controller;

import org.coke.domain.MemberVO;
import org.coke.service.BoardService;
import org.coke.service.MemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		if(memberService.updateMember(vo)) {
			rttr.addFlashAttribute("result", "success");
		
		}
		
		rttr.addAttribute("userid", vo.getUserid());
		
		return "redirect:/myPage/main";
	}

}
