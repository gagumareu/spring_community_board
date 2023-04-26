<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../include/header.jsp" %>

<link href="/resources/css/notice.css" type="text/css" rel="stylesheet">

<div class="board_content">
	<div class="board_content_wrapper">
		<div class="notice_wrapper">
			<h3>개선할 사항</h3>
			<ul style="list-style: initial">
				<li>로그인 / 비밀번호 오류시 알림</li>
				<li>로그인 / 회원정보 찾기</li>
				<li>회원 가입시 아이디 특수문자 및 공백 설정, 한글 X</li>
				<li>-------------------</li>
				<li>대댓글 기능</li>
				<li>-------------------</li>
				<li>프로필 사진 변경시 로컬 서버 삭제</li>
				<li>프로필 기본 사진 변경 기능 추가</li>
				<li>-------------------</li>
				<li>게시글 및 댓글 작성시간 시간 단위로 수정</li>
				<li>게시물 작성시 널 값 불가 기능 추가</li>
				<li>summernote 게시글 작성전 이미지 삭제시 로컬서버에서도 삭제하기</li>						
				<li>content 글자 수 제한 늘리기</li>						
				<li>title 글자 수 제한 늘리기</li>						
				<li>summernote 이미지 삭제시 로컬서버 삭제</li>						
				<li>프로필 사진 image 파일만 적용</li>						

			</ul>
			
		</div> <!-- notice_wrapper -->
		
	</div> <!-- board_content_wrapper -->
</div> <!-- board_content -->
	
</div> <!-- wrapper -->
	
	
<%@ include file="../include/footer.jsp" %>
	
</body>
</html>

					
						
						
						
				

	