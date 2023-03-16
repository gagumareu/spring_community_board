package org.coke.controller;


import org.coke.domain.BoardVO;
import org.coke.mapper.ComputerMapper;
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
@RequestMapping("/computer")
@Log4j
@AllArgsConstructor
public class ComputerController {
	
	private ComputerMapper mapper;
	
	@GetMapping("comList")
	public void getComputerList(Model model) {

		log.info("computer List");
		
		model.addAttribute("ComList", mapper.getList());
		
	}
	
	@GetMapping("/comInsert")
	public void getinsertPage() {
		
	}
	
	
	@PostMapping("/insert")
	public String insert(BoardVO vo, RedirectAttributes rtts) {
		
		log.info("vo: " + vo );
		
		mapper.insert(vo);
		
		rtts.addFlashAttribute("result", vo.getBno());
		
		if(vo.getBsort() == "컴퓨터") {
			
			return "redirect:/computer/comList";
		}else {
			return "redirect:/board/list";
		}
		
		
	}

}
