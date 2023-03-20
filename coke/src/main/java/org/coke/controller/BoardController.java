package org.coke.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.coke.domain.BoardAttachVO;
import org.coke.domain.BoardVO;
import org.coke.domain.Criteria;
import org.coke.domain.PageDTO;
import org.coke.mapper.BoardAttachMapper;
import org.coke.mapper.ComputerMapper;
import org.coke.mapper.ReplyMapper;
import org.coke.service.BoardService;
import org.coke.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
		
	private ReplyMapper replyMapper;
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete file");
		log.info(attachList);
		
		attachList.forEach(attach -> {
						
			try {
				Path files = Paths.get("C:\\workspace\\upload\\coke\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(files);
				
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}			
		});
		
	}
	
	
	
	@GetMapping("/list")
	public void empList(Model model, Criteria cri, @RequestParam(value = "bsort", required = false) String bsort) {
		
		cri.setBsort(bsort);
		
		log.info("--------------------------------");
		log.info("boardList:  " + cri);
		log.info("sort: " + bsort);
		log.info("pageNum: " + cri.getPageNum());
		log.info("sort by cri: " + cri.getBsort());
		
		int total = boardService.getTotalAmount(cri);

		if(cri.getBsort() != null) {
			model.addAttribute("tagList", boardService.getTagList(cri));
			log.info("cri sort: " + cri.getBsort());
		}		
		
		model.addAttribute("boardList", boardService.getBoardList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
								
	}
	
	
	@GetMapping("/writeBoard")
	public void writeBoard(@RequestParam(value = "bsort", required = false) String bsort, Model model) {
		
		if(bsort != null) {
			
			log.info("sort: " + bsort);
			
			model.addAttribute("bsort", bsort);
		}
	}
	
	@PostMapping("/register_board")
	public String registerBoard(BoardVO boardVO, RedirectAttributes rttr, Model model) {
		
		log.info("========================");
		
		log.info("register board: " + boardVO);
		
		if(boardVO.getGetAttachList() != null) {
			boardVO.getGetAttachList().forEach(attach -> log.info(attach));
		}
						
		boardService.writeBoard(boardVO);
								
		Criteria cri = new Criteria();
		cri.setBsort(boardVO.getBsort());
		
		rttr.addFlashAttribute("success", boardVO.getBno());
		rttr.addAttribute("bsort", cri.getBsort());
		
		return "redirect:/board/list";
		
	}	
	
	
	@GetMapping("/read_board")
	public void readBoard(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		
		log.info("readBoard :" + bno);
		boardService.getHitCount(bno);
		model.addAttribute("BoardVO", boardService.readBoard(bno));
		model.addAttribute("replyList", replyMapper.getListWithPaging(cri, bno));
	}
	
	@GetMapping("/modify")
	public void modifyBoard(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		
		log.info("readBoard :" + bno);
		
		model.addAttribute("boardDto", boardService.readBoard(bno));

	}
	
	@PostMapping("/modify_board")
	public String modifyBoard(BoardVO boardVO, 
			@ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr,
			Model model) {
		
		log.info("bno: " + boardVO.getBno());
		log.info("modify board: " + boardVO);
		
		if(boardService.modifyBoard(boardVO)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String deleteBoard(BoardVO boardVO, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		log.info("delete board: " + boardVO.getBno());
		
		List<BoardAttachVO> list = boardService.getAttachLsit(boardVO.getBno());
		
		if(boardService.removeBoard(boardVO.getBno())) {
			
			deleteFiles(list);
			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	 
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(long bno){
		
		
		return new ResponseEntity<>(boardService.getAttachLsit(bno), HttpStatus.OK);
	}

	
	
	
	
	
}
