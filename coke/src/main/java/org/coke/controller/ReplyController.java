package org.coke.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.crypto.Data;

import org.coke.domain.AttachFileDTO;
import org.coke.domain.BoardAttachVO;
import org.coke.domain.Criteria;
import org.coke.domain.ReplyAttachVO;
import org.coke.domain.ReplyVO;
import org.coke.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	private void deleteFile(List<ReplyAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			
		}
		
		log.info("delete attached files... ");
		
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				
				Path files = Paths.get("C:\\workspace\\upload\\reply\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(files);
				
			} catch (Exception e) {
				log.error("delete files error" + e.getMessage());
			}
		});
		
	}
	
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
	
		log.info("ReplyVO: " + vo);
		log.info("bno: " + vo.getBno());
		
		int insertCount = replyService.register(vo);

		log.info("reply insert count: " + insertCount);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("bno") long bno, @PathVariable("page") int page){
		
		log.info("getList...........");
		
		Criteria cri = new Criteria(page, 10);
		
		log.info("bno (replyController): " + bno);
		log.info(cri);
		
		return new ResponseEntity<>(replyService.getList(cri, bno), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){
		
		log.info("reply get by rno: " + rno);
		
		return new ResponseEntity<>(replyService.get(rno), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value = "{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo){
		
		log.info("remove reply by rno : " + rno);
		
		List<ReplyAttachVO> list = replyService.getAttachList(rno);
		
		int count = replyService.remove(rno);
		
		if(count == 1) {
			deleteFile(list);
		}
		
		return count == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) 
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(
			method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value = "/{rno}", 
			consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify rno: " + rno);
		log.info("modify vo : " + vo);
		
		return replyService.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) 
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	
}
