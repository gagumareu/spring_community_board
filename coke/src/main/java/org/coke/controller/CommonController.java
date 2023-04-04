package org.coke.controller;

import org.coke.domain.MemberVO;
import org.coke.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
public class CommonController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

	private PasswordEncoder encoder;
	
	@GetMapping("/LoginPage")
	public void LoginPage(String error, String logout, Model model) {
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
		
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied: " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/Logout")
	public void logoutGet() {
		log.info("GO logout");
	}
	
	@GetMapping("/SignUpPage")
	public void SignUp() {
		log.info("Sign UP");
	}
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/signUp")
	public void SignUpPost(MemberVO vo) {
		
		log.info("insert member_log.info");
		System.out.println("insert member_system.out.pring");
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		
		memberService.signUpMember(vo);
	}
	
	
}
