<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="include/header.jsp" %>


<style type="text/css">
	
	.board_loginPage{
		text-align: center;
	}
	
	
	
</style>

	<div class="board_write_wrapper">
	
		<div class="board_loginPage">
			<h1>Login Page COKE</h1>
			<h2>${error }</h2>
			<h2>${logout }</h2>
			
			<form action="/login" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div>
					<input type="text" name="username">
				</div>
				<div>
					<input type="password" name="password">
				</div>
				<div>
					<input type="checkbox" name="remember-me">자동 로그인
				</div>
				<div>
					<input type="submit">
				</div>
			</form>
		</div> <!-- board_loginPage -->
		
		<%@ include file="include/footer.jsp" %>
	</div> <!-- board_write_wrapper -->
	
	
	
	
</body>
</html>

					
						
						
						
				

	