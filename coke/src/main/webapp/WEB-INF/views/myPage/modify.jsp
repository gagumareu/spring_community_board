<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
		font-size: 12px;
		display: flex;
		flex-direction: row;
		border-bottom: 1px solid #e5e7eb;
		/*height: 90px;
		justify-content: space-between;
		*/
	}
	
	.board_content_list{
		width: 70%;
		border-top: 1px solid #e5e7eb;
		text-align: center;

	}

	.board_list_title_wrapper{
		display: flex;
   		flex-direction: column;
   		gap: 4px;
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
    	margin-left: 8px;
	}
	
	.board_list_view{
	    margin-left: 5px;

		display: flex;
   		flex-direction: row;
	}
	
	.board_list_view img{
		width: 17px;
   		height: 17px;
	}
	
	.board_list_hit{
	    display: flex;
  			flex-direction: row;

	}
	
	.board_list_hit img {
		width: 23px;
	}
	
	.hitCounting{
		align-self: center;
		margin-left: 5px;
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
    	font-family: 'Jua', sans-serif;
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
	
	.leftSideBox{
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
	.lefsSideBoxing{
		margin-bottom: 80px;
	}
	
	.backLogList{
		display: flex;
	    flex-direction: column;
	    text-align: center;
	    gap: 13px;
	}
	
	.rightBoxing{
		margin-bottom: 80px;
	}
	
	.profileDvi{
		display: flex;
    	justify-content: center;
	}
	
	.profileImageBox{
	    border-radius: 100%;
        width: 100px;
    	height: 100px;
	}
	
	
	
	#InputFile{
		display: none;
	}
	
	#profileImg{
		border-radius: 100%;
		width: 100%;
		height: 100%;
	}
	
	.memberinfoBox{
		display: grid;
    	grid-template-columns: 1fr 1fr 1fr;
    	column-gap: 5px;
    	
	}
	
	.inforBoxes{
		text-align: center;
		padding: 18px;
    	border: 1px solid black;
    	font-size: 1.3em;
    	font-family: 'Jua', sans-serif;
	}
	
	.inforBoxes:hover{
		background-color: #e5e7eb;
		cursor:pointer;
	}
	
	</style>
		
		
		<div class="board_content">
						
			<div class="board_content_wrapper">
				
				<div class="leftSideBox">
					<div class="lefsSideBoxing">
						<div class="sideBox_title">
						TOP WRITER
						</div>
						<div class="topwriter_line">
						</div>
						<c:forEach begin="0" end="9" items="${topwriterList }" var="dto">
						<div class="topwriterBoxes">	
							<a href="#">${dto.userid }</a>  <div>${dto.counting }</div>	
						</div>	
						</c:forEach>					
					</div>
					<div class="lefsSideBoxing">
						<div class="sideBox_title">
						MOST VIEW
						</div>
						<div class="topwriter_line">
						</div>
						<c:forEach items="${mostViewList }" var="dto" begin="0" end="9">
						<div class="topwriterBoxes">	
						<a class="sideTitleToReading" href="${dto.bno}">${dto.btitle }</a>  <div style="margin-left: 10px">${dto.bhit }</div>	
						</div>	
					</c:forEach>					
					</div>				
				</div> <!-- topwriterList -->
							
				<div class="board_content_list">
				
					<div class="memberinfoBox">
						<div class="inforBoxes" id="modify">
							회원 정보 변경
						</div>
						<div class="inforBoxes">
							내가 쓴 글
						</div>	
						<div class="inforBoxes">
							내가 쓴 댓글
						</div>
					</div> <!-- memberinfoBox -->
					
					<div class="profileDvi">
						<div class="profileImageBox">
							<img id="profileImg" alt="" style="width: 100px" src="/resources/upload/icon/profileIamge.png">													
						</div> <!-- profileImageBox -->
						<form action="" method="post">
							<input id="InputFile" type="file" name="uploadFile">
						</form>
					</div> <!-- profileDvi -->
					
				</div> <!-- board_content_list -->
				
				
				
				<div class="rigthSideBox">
					<div class="rightBoxing">
						<div class="sideBox_title">
						업데이트 예정
					</div>
					<div class="topwriter_line">
					</div>
					<div class="backLogList">
						<div>회원 마이 페이지</div>
						<div>게시물 스크렙 기능</div>
						<div>회원 프로파일 이미지</div>
						<div>회원 가입 페이지</div>
						<div>게시물 리스트 정렬 방식</div>
					</div>
					</div>
					<div class="rightBoxing">
						<div class="sideBox_title">
						MOST REPLY
					</div>
					<div class="topwriter_line">
					</div>
					<div class="backLogList">
						<c:forEach items="${mostReplyList }" var="dto" begin="0" end="9">
							<div class="topwriterBoxes">
								<a class="sideTitleToReading" href="${dto.bno }">${dto.btitle }</a> <div style="margin-left: 10px">${dto.replycnt }</div>
							</div>
						</c:forEach>
					</div>
					</div>
				</div>
			
			</div> <!-- board_content_wrapper -->
			
		</div> <!-- board_content -->
	
		
		
		
	</div> <!-- wrapper -->
	<%@ include file="../include/footer.jsp" %>
	
<script>
	$(document).ready(function(){
		
		
		var userid = null;		
		<security:authorize access="isAuthenticated()">		
			userid ="<security:authentication property="principal.username"/>";		
		</security:authorize>
		
		var actionForm = $(".actionForm");
		
		$("#modify").on("click", function(){
			console.log("clicked");	
			actionForm.append("<input type='hidden' name='userid' value='"+userid+"'>");
			actionForm.submit();
			
		});
				
		var imageBox = $("#profileImg");
		var inputImage = $("input[name='uploadFile']");
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(imageBox).on("click", function(e){
			console.log("clicked");
			inputImage.click();
		});
		
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			
			console.log("changed");
			
			var file = inputImage[0].files;
			
			console.log(file);
			
			for(var i = 0; i < file.length; i++){
				formData.append("uploadFile", file[i]);	
			}
										
			console.log(formData);
			
			// FormData의 key 확인
			for (var key of formData.keys()) {
			     console.log(key);
			}
			            
			// FormData의 value 확인
			for (var value of formData.values()) {
			     console.log(value);
			}
			
			$.ajax({
				url: '/uploadProfile',
				processData: false,
				contentType: false, 
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
				type: 'POST',				
				dataType: 'json',
				success: function(result){
					console.log(result);
					showUpload(result);
				}
			});			
		}); 
		
		function showUpload(arr){
			
			if(!arr){
				return;
			}
			
			var imageDiv = $(".profileImageBox");
			
			var str = "";
			
			$(arr).each(function(i, dto){
				
				console.log(dto.uploadPath);
				console.log(dto.uuid);
				console.log(dto.fileName);
				console.log(dto.image);
				
				var fileCallPath = encodeURIComponent(dto.uploadPath + "/" + dto.uuid
						+ "_" + dto.fileName);
				console.log(fileCallPath);
				
				var path = ""+dto.uploadPath+" + '/' + "+dto.uuid+" + '_' + "+dto.fileName+"";
				console.log(path);
				str += "<img id='profileImg' style='width: 100px' src='/displayProfile?fileName="+fileCallPath+"'>";
			//	str += "<img id='profileImg' style='width: 100px' src='/resources/upload/icon/click1.png'>";
				
			});
			imageDiv.html("");
			imageDiv.append(str);
		} // showUpload end
	});
	

</script>
	
	
</body>
</html>

					
						
						
						
				

	