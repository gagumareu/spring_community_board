<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="include/header.jsp" %>


<style type="text/css">

	a:hover {
	 color: #7ba6de;
	  text-decoration: none;
	}
	
	.board_loginPage{
		text-align: center;
	}
	
	.board_write_wrapper{
		margin-top: 53px;
	}
	
	.loginForm{
		display: flex;
	    flex-direction: column;
	    gap: 6px;
	}
	
	.loginBTN{
		background-color: #3ab4e8;
	    color: white;
	    /* padding: 4px; */
	    border-radius: 1.5rem;
	    border: solid;
	    padding: 5px 12px 5px 12px;
	}
	
	.loginBTN:hover{
		background-color: #0c81b3;
	}
	
	.loginInput{
		border-radius: 8px;
	    border: 1px solid #e5e7eb;
	    height: 28px;
	}
	
	
</style>

	<div class="board_write_wrapper">
	
		<div class="board_loginPage">
			<h1 style="font-family: 'Jua', sans-serif">로그인</h1>
			<h2>${error }</h2>
			<h2>${logout }</h2>
			
			<form class="loginForm" action="/login" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div>
					<input class="loginInput" type="text" name="username" autofocus="autofocus" placeholder="ID">
				</div>
				<div>
					<input class="loginInput" type="password" name="password" placeholder="PASSWORD">
				</div>
				<div>
					<input type="checkbox" name="remember-me">로그인 정보 기억
				</div>
				<div>
					<button class="loginBTN" type="submit">로그인</button>
				</div>
				<div>
					<a href="/SignUpPage">회원가입</a>
				</div>
			</form>
		</div> <!-- board_loginPage -->
		
		<%@ include file="include/footer.jsp" %>
	</div> <!-- board_write_wrapper -->
	
	
	
	
</body>
</html>

					
						
						
						
				

	