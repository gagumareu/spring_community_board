package org.coke.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.coke.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Test
	public void testInsertMember() {
		
		String sql = "insert into coke_member (userid, userpw, username) values(?,?,?)";
		
		for(int i = 0; i < 100; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, encoder.encode("pw" + i));
				
				if(i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "일반사용자" + i);
				}else if(i < 90) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(3, "운영자" + i);
				}else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(3, "관리자" + i);
				}
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e2) {
						
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (Exception e2) {
						
					}
				}
			} // end try
			
		} // end for
		
	}
	
	@Test
	public void TestInsertAuth() {
		
		String sql = "insert into coke_member_auth (userid, auth) values(?,?)";
		
		for(int i = 0; i < 100; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				}else if(i < 90) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				}else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e2) {
						
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (Exception e2) {
						
					}
				}
			}
			
		}
		
	}
	
	
	
	
	@Test
	public void inserUser() {
		
		String sql = "insert into coke_member (userid, userpw, username) values(?,?,?)";
		
		Connection con = null;
		PreparedStatement pstmt= null;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "testuser1");
			pstmt.setString(2, encoder.encode("1234"));
			pstmt.setString(3, "tester1");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(con != null) {
				try {
					con.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
		
		
		
		
		
		
		
	}
	
	
	
	
	

}
