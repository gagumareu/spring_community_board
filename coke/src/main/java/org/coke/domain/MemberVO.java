package org.coke.domain;

import lombok.Data;

@Data
public class MemberVO {

	private Long mno;
	private String mname;
	private String nickname;
	private String mpassword;
	private String email;
	private String phone;
	private String addr;
	
}
