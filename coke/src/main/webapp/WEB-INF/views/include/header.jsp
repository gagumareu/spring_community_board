<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JH PROJECT</title>



<style type="text/css">
	
	html{
		height: 100%;
		

	}
	
	a:hover {
	  /*color: #7ba6de;*/
	  text-decoration: none;
	}
	
	body{
		min-height: 100vh;
		display: flex;
		flex-direction: column;
		width: 100%;
		align-items: center;
	}
	
	
	ul {
		list-style: none;
	}
	
	p{
		text-align: center;
	}
	
	.footer{
		margin-top: auto;
		width: 100%;
		border-top: 1px solid #e5e7eb;
		margin-top: 5em;
	}
	
	.footerWrapper{
		display: flex;
	    justify-content: space-around;
	    margin-top: 50px;
	    margin-bottom: 50px;
	
	}
	.wrapper{
		display: flex;
		flex-direction: column;
		width: 100%;
	    /*border: 3px solid red;*/
    	min-height: 100vh;
    	width: 1200px;
    	min-width: 1200px;
		
	}
	
	.header {
		display: flex;
    	flex-direction: column;
    	/*border: 2px solid black;*/
    	width: 100%;
    	font-family: 'Jua', sans-serif;
    	font-size: 16px;
    	/*background-color: #a2c0e7;*/
    	height: 67px;
    	border-bottom: 1px solid #e5e7eb;
    	
	}
	
	.header_navbar{
		display: flex;
    	flex-direction: row;
    	/*border: 2px solid black;*/
    	height: 100%;
    	width: 100%;
    	align-items: center;
		justify-content: space-between;
	}
	
	.header_sort {
		display: flex;
    	flex-direction: row;
    	margin-left: 90px;
    	align-items: center;
	}
	
	.header_sort_title {
		margin-left: 1.5em;
	}
	.header_login{
		display: flex;
    	flex-direction: row;
    	align-items: center;
	}
	
	.header_login a{
		background-color: #3ab4e8;
	    color: white;
	    padding: 4px;
	    border-radius: 1.5rem;
	
	}
	
	.header_login a:hover{
		background-color: #0c81b3;
		color: white;
	}
	.header_search_form{
		display: flex;
		justify-content: end;
		/* border: 1px solid; */
	    margin-top: 0.6em;
	    margin-bottom: 0.6em;
	}
	
	.header_login_btn {
		margin-left: 7em;
	}
	
	.header_signUp_btn {
		margin-left: 1.5em;
	    margin-right: 1.1em;
	}
	
	
	.header_main_log{
		font-size: 2em;
		color: black;
	}
	
	.header_sortAndLogin_warpper{
		display: flex;
    	flex-direction: row;
	}
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- summernote editor  -->

 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
 
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
    
<!-- <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css"> 
    
  <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
-->
</head>

<body>
	<div class="wrapper">
		<div class="header" >
		
			
			
			<div class="header_navbar">
				
				
				<div class="header_sortAndLogin_warpper">
					<div class="header_main_log">
						<a href="/board/list">MAIN</a>
					</div>
					<div class="header_sort">
						<div>
							<a href="/board/list">전체글</a>
						</div>
						<div class="header_sort_title">
							<a href="/board/list?bsort=음악">음악</a>
						</div>
						<div class="header_sort_title">
							<a href="/board/list?bsort=지식">지식</a>
						</div>
						<div class="header_sort_title">
							<a href="/board/list?bsort=컴퓨터">컴퓨터</a>
						</div>
						<div class="header_sort_title">
							<a href="/board/list?bsort=커뮤니티">커뮤니티</a>
						</div>
						<div class="header_sort_title">
							<a href="/board/list?bsort=질문">Q&A</a>
						</div>
						<div class="header_sort_title">
							<a href="#">공지사항</a>
						</div>
					</div>
				</div>
				<div class="header_login">
				
					<security:authorize access="isAnonymous()">
						<div>
							<a href="/LoginPage">로그인</a>
						</div>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<div class="header_login_btn">
							<a href="/Logout">로그아웃</a>
						</div>
					</security:authorize>
					
					<div class="header_signUp_btn">
						<a href="/SignUpPage">회원가입</a>
					</div>
				</div> <!-- header_login -->
				
			</div> <!-- header_navbar -->
			
			
			
		</div> <!-- header -->




