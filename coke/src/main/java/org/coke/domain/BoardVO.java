package org.coke.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String userid;
	private String btitle;
	private String bcontent;
	private int bhit;
	private String bsort;
	private Date bregdate;
	private Date bupdate;
	private String nickname;
	private String btag;
	private int replycnt;
	
	private List<BoardAttachVO> getAttachList;
	
	
}
