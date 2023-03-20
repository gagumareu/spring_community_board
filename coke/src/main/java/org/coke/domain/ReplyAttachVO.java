package org.coke.domain;

import lombok.Data;

@Data
public class ReplyAttachVO {

	private long rno;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
}
