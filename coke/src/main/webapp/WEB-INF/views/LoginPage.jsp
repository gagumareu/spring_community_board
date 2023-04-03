<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
			<input type="checkbox" name="remember-me">Remember
		</div>
		<div>
			<input type="submit">
		</div>
	</form>
	
</body>
</html>