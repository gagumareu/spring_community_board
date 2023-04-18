package org.coke.controller;

import java.io.File;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.coke.domain.AttachFileDTO;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.HttpHandler;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Pre;

@Controller
@Log4j
@AllArgsConstructor
public class UploadController {
	
	
	private String getFoler() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAction", produces = org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost2(MultipartFile[] uploadFile) {
		
		log.info("upload Ajax post");
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\workspace\\upload\\coke";
		
		String uploadFolderPath = getFoler();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		log.info("uploadPath : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO dto = new AttachFileDTO();
			
			log.info("-------------------------");
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("uploadfile size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			
			log.info("only file name: " + uploadFileName);
			
			dto.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				
				File saveFile = new File(uploadPath, uploadFileName);
	
				multipartFile.transferTo(saveFile);
				
				dto.setUuid(uuid.toString());
				dto.setUploadPath(uploadFolderPath);
				dto.setImage(true);
				
				list.add(dto);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
		}  // end for 
	
	return new ResponseEntity<>(list, HttpStatus.OK);			
			
	
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/replyUploadAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> replyUploadAjaxPost(MultipartFile[] multipartFiles){
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\workspace\\upload\\reply";
		
		String uploadFolderPath = getFoler();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		log.info("uploadPath: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : multipartFiles) {
			
			log.info("get for" );
			
			AttachFileDTO dto = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("originalFileName " + uploadFileName);
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("uploadFilName: " + uploadFileName);
			
			dto.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				
				multipartFile.transferTo(saveFile);
				
				dto.setUuid(uuid.toString());
				dto.setUploadPath(uploadFolderPath);
				dto.setImage(true);
				
				list.add(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end for 
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}


	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("file Name(/display): " + fileName);
		
		File file = new File("C:\\workspace\\upload\\coke\\" + fileName);
		
		log.info("File(/display): " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/displyReply")
	@ResponseBody
	public ResponseEntity<byte[]> getReplyFiles(String fileName){
		
		log.info("fileName : " + fileName);
		
		File file = new File("C:\\workspace\\upload\\reply\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deletefiles")
	@ResponseBody
	public ResponseEntity<String> deleteFiles(String fileName){
		
		log.info("filename(delete): " + fileName);
		
		File file;
		
		try {
			
			file = new File("C:\\workspace\\upload\\coke\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadProfile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileDTO> uploadProfile(@RequestPart("uploadFile") MultipartFile uploadFile){
		
		log.info("-------------------------------");
		log.info("upload profile ajax");
		log.info("uploadFile: " + uploadFile);
		
		AttachFileDTO dto = new AttachFileDTO();
				
		String uploadFolder = "C:\\workspace\\upload\\profile";
		
		String uploadFolderPath = getFoler();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		log.info("uploadPath: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		String uploadFileName = uploadFile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		dto.setFileName(uploadFileName);
		
		log.info("uploadFileName: " + uploadFileName);
		
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		
		log.info("fileNameWithUUID: " + uploadFileName);
		
		try {
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			uploadFile.transferTo(saveFile);
			
			dto.setUuid(uuid.toString());
			dto.setUploadPath(uploadFolderPath);
			dto.setImage(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(dto, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/displayProfile")
	@ResponseBody
	public ResponseEntity<byte[]> getProfileFiles(String fileName){
		
		log.info("fileName : " + fileName);
		
		File file = new File("C:\\workspace\\upload\\profile\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
