<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/header.jsp" %>

	<style type="text/css">
		a{
			text-decoration: none;
			color: black;
		}
		
		a:hover {
		  color: #7ba6de;
		  text-decoration: none;
		}
		
		.dto_list{
			padding: 10px;
			justify-content: space-between;
			display: flex;
			flex-direction: row;
			border-bottom: 1px solid #e5e7eb;
			height: 90px;
		}
		
		.board_content_list{
			width: 70%;
			border-top: 1px solid #e5e7eb;
	
		}

		.board_list_title_wrapper{
			display: flex;
    		flex-direction: column;
    		gap: 0.2em;
		}
		
		.board_list_nickName_wrapper{
			display: flex;
	    	flex-direction: row;
		}
		
		.board_list_nickNameDiv{
			margin-right: 0.7em;
		}
		.move{
			font-size: 1.5em;
			
		}
		
		.board_list_hit_wrapper{
			display: flex;
	   		flex-direction: row;
	    	align-items: center;
		}
		
		.board_list_view{
		    margin-left: 20px;

			display: flex;
    		flex-direction: row;
		}
		
		.board_list_view img{
			width: 25px;
		}
		
		.board_list_hit{
		    display: flex;
   			flex-direction: row;

		}
		
		.board_list_hit img {
			width: 26px;
		}
		
		.hitCounting{
			align-self: center;
		
		}
		
		.board_list_viewCounting{
			align-self: center;
			margin-left: 5px;
		}
		
		.tagLink{
			margin-left: 0.9em;
		}
		
		.tagOrsort a{
			color: #7ba6de;
		}
		
		.board_top_content_tagSort a{
			font-size: 1.1em;
		}
		
		
		
		
		
	.board_search{
	text-align: center;
	}
	
	.board_top_content {
		display: flex;
    	flex-direction: row;
    	justify-content: center;
    	width: 70%;
	}
	
	.board_top_content_wrapper{
		display: flex;
	    /* flex-direction: row; */
	    width: 100%;
		justify-content: space-between;
	}
	
	.board_top_content_register{
    	width: 20%;
		font-size: 1.2em;
	}
	.board_top_content_register a{
		background-color: #3ab4e8;
	    color: white;
	    padding: 5px;
	    border-radius: 8px;
	    font-family: 'Jua', sans-serif;
	}
	
	.board_top_content_register a:hover{
		background-color: #0c81b3;
		
	}
	
	.board_top_content_tagSort{
		display: flex;
    	flex-direction: row;
    	width: 60%;
    	justify-content: center;
    	
	}
	
	.board_top_content_filter{
    	width: 20%;
		text-align: end;
	}
	
	.tag_btn{
		padding: 0px 10px 0px 10px;
	}
	
	
	.board_content{
		width: 100%;
		margin-top: 1.5em;
		display: flex;
	    flex-direction: column;
	    margin-top: 30px;
	    /* border: 2px solid red; */
	    /* justify-content: center; */
	    align-items: center;
	}
	
	.board_content_wrapper{
		display: flex;
    	flex-direction: row;
   	    margin-top: 30px;
    	/*border: 2px solid red;*/
    	justify-content: center;
    	width: 100%;
    	font-family: 'Prompt', sans-serif;
	}
	
	
	
	
	
	
	
	.board_paging ul {
		list-style-type: none;
		display: flex;
		justify-content: center;
		padding: 0px;
	}
	

	
	.paginate_button {
		margin-left: 1.2em;
	}
	
	.header_search_div{
		border-radius: 43px;
	    border-width: 1px;
	}
	
	<!--  -->
	
	.topwriterList{
		width: 15%;
		padding-right: 30px;
	}
	
	.sideBox_title{
	   text-align: center;
	   font-size: 1.1em;
	   font-weight: 600;
	}
	
	.topwriter_line{
		border-bottom: 1px solid #e5e7eb;
	    margin-bottom: 15px;
	    margin-top: 15px;
	}	
	
	.topwriterBoxes{
		display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    margin-bottom: 10px;
	    font-size: 0.9em;
	}
	
	.rigthSideBox{
		width: 15%;
		padding-left: 30px;
	}
	
	.rigthSideBox ul li {
		margin-bottom: 10px;
		/*border: 1px solid #e5e7eb;*/
	}
	
	.searchBTN{
		background-color: #3ab4e8;
	    color: white;
	    padding: 4px;
	    border-radius: 8px;
	    border: wheat;
	    font-family: 'Jua', sans-serif;
	    
	}
	
	.searchBTN:hover {
	  background-color: #0c81b3;
	}
	
	.searchInput{
		border-radius: 8px;
    	border: 1px solid #e5e7eb;
    	height: 28px;
	}
	
	</style>
		
		
		<div class="board_content">
			<div class="board_content_wrapper">
				<div class="notice_wrapper">
					<h3>개선할 사항</h3>
					<ul style="list-style: initial">
						<li>첫 페이지 만들기</li>
						<li></li>
						<li>-------------------</li>
						<li>로그인 / 비밀번호 오류시 알림</li>
						<li>로그인 / 회원정보 찾기</li>
						<li>-------------------</li>
						<li>대댓글 기능</li>
						<li>댓글 summernote 이미지 첨부시 사진크기 제안(보류)</li>
						<li>-------------------</li>
						<li>비로그인 access denied</li>
						<li>delete access denied</li>
						<li>-------------------</li>
						<li>게시글 및 댓글 작성시간 시간 단위로 수정</li>
						<li>게시물 작성시 널 값 불가 기능 추가</li>
						<li>인기 게시물 추가</li>						
						<li>summernote 게시글 작성전 이미지 삭제시 로컬서버에서도 삭제하기</li>						
						<li>content 글자 수 제한 늘리기</li>						
						<li>title 글자 수 제한 늘리기</li>						

					</ul>
					
				</div> <!-- notice_wrapper -->
				
			</div> <!-- board_content_wrapper -->
		</div> <!-- board_content -->
	
	
		
		
	</div> <!-- wrapper -->
	
	
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>

					
						
						
						
				

	