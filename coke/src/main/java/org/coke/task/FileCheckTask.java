package org.coke.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.coke.domain.BoardAttachVO;
import org.coke.mapper.BoardAttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	private String getOldFolderYesterday() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception{
		
		log.warn("File Check Task run... ");
		
		log.warn(new Date());
		// files list in database
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		// ready for check files in directory with database file list
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("C:\\workspace\\upload\\coke", vo.getUploadPath(), vo.getUuid() + "_" + 
				vo.getFileName())).collect(Collectors.toList());
		
		log.warn("==============================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		// files in yesterday directory
		File targetDir = Paths.get("C:\\workspace\\upload\\coke", getOldFolderYesterday()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("----------------------------------------------------------");
		for(File file : removeFiles) {
			
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
	
	
}
