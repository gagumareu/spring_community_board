package org.coke.domain;

import lombok.Data;

@Data
public class MemberAttachVO {
	
	private String userid;
	private String uuid;
	private String uploadPath;
	private String fileType;

}
