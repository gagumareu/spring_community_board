package org.coke.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	
	private long bno;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;

}
