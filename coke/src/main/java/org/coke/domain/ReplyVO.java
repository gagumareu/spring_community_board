package org.coke.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
	
	private List<ReplyAttachVO> attachList;
}
