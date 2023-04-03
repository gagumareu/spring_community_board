<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGOUT PAGE</h1>
	
	<form action="/Logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button type="submit">로그아웃</button>
	</form>
	
	<c:if test="${param.logout != null }">
		<script>
			$(document).ready(function(){
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
	
</body>
</html>