<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="include/header.jsp" %>


<style type="text/css">
	
	

	
	
	
	
</style>

		<div class="board_write_wrapper">
		
			<div>
				<h1>SignUp Page</h1>
			</div>
			
			<form action="/signUp" method="post">
				
				<div>
					<label>userid</label><input type="text" name="userid">
				</div>
				<div>
					<label>passwoard</label><input type="password" name="userpw">
				</div>
				<div>
					<label>username</label><input type="text" name="username">
				</div>
				<input type="hidden" name="auth" value="ROLE_USER">
				<button type="submit">제출</button>
			</form>
			
		</div> <!-- board_write_wrapper -->
	
	
		<%@ include file="include/footer.jsp" %>
		
	</div> <!-- wrapper -->
	
	
	
	
</body>
</html>

					
						
						
						
				

	