<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   

<%@ include file="../include/header.jsp" %>


<style type="text/css">
	
	

	
	/******* board content***********/
	
	.board_write_wrapper{
		width: 100%;
		margin-top: 1.5em;
	}
	
	.board_write_titleAndSort{
		display: flex;
		flex-direction: column;
	}
	
	
	
	
	
	.board_write_title{
		margin-top: 0.7em;
		margin-bottom: 1.7em;
		height: 50px;
		border-radius: 8px;
		border: 1px solid #e5e7eb;
		font-size: 1.4em;
		padding: 10px;

	}
	
	.board_write_sort_wrapper{
		display: flex;
   	 	flex-direction: row;
    	margin-top: 0.7em;
		margin-bottom: 1.7em;
	}
	
	.board_write_sort_first{
		 margin-right: 0.5em;
   		 width: 80%;
		border-radius: 8px;
		border: 1px solid #e5e7eb;
		padding: 10px;
	}
	
	.board_write_sort_second{
		width: 20%;
		border-radius: 8px;
		border: 1px solid #e5e7eb;
		padding: 10px;
	}
	
	.board_write_insert_btn{
	    display: flex;
    	justify-content: end;
    }
	
	
	
	/******** tag and search *******/
	
	.board_search{
		text-align: center;
	}
	
	.board_top_content {
		display: flex;
    	flex-direction: row;
	}
	
	.board_top_content_register{
    	width: 20%;
	
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
	
	/******************************/
	
	
	#uploadBtn{
		margin-right: 0.7em;
		
	}
	
	
</style>



		
		
		<div class="board_write_wrapper">
		
			<form action="/computer/insert" role="form" method="post">
			
				<div class="board_write_titleAndSort">
					
					<input class="board_write_title" type="text" name="btitle" placeholder="게시판 제목을 입력하세요." required>
			 		
			 		<div class="board_write_sort_wrapper" >
			 			<select class="board_write_sort_first" name="bsort" required>
						  	<option value="">카테고리를 선택해주세요</option>
						  	<option value="음악">음악</option>
						  	<option value="지식">지식</option>
						  	<option value="컴퓨터" selected>컴퓨터</option>
						  	<option value="커뮤니티">커뮤니티</option>
						  	<option value="Q&A">Q&A</option>
					  	</select>
						  <select class="board_write_sort_second" name="btag" required>
						  	<option value="">테그를 선택해주세요</option>
						  	<option value="하드웨어">하드웨어</option>
							<option value="소프트웨어">소프트웨어</option>
							<option value="주변기기">주변기기</option>
						  </select>
			 		</div> <!-- board_write_sort_wrapper -->	
				</div> <!-- board_write_titleAndSort -->
			 
			  
		       <textarea name="bcontent" id="summernote" required > </textarea>
				<script>
				    $(document).ready(function() {
				        $('#summernote').summernote({
				        	height: 500,
				        	callbacks:{
								onImageUpload: function(files, editor, welEditable){						
			    		            for (var i = files.length - 1; i >= 0; i--) {
			    		            	console.log(files[i]);
			        		            uploadImageFile(files[i],this);
								
										}
									} // onImageUpload
									
								}
							});
				    });
				 </script>
			    	 

			  <div class="board_write_insert_btn">
			  	<button id="uploadBtn" type="submit">작성</button>
			  	<button id="cancelBtn" type="submit">취소</button>
			  </div>
			  
			  <!-- temporary input hidden tag -->
			  <input type="hidden" name="email" value="user3@email.com">
			  <input type="hidden" name="nickname" value="tester3">
			</form>
			
		</div> <!-- board_write_wrapper -->
	
	
		<div class="footer">
			<h1>TEST</h1>
		</div> <!-- footer -->
		
	</div> <!-- wrapper -->
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			var formObj = $("form");
			
			$("#cancelBtn").on("click", function(e){
				
				e.preventDefault();
				console.log("clecked");
				
				formObj.attr("action", "/computer/comList").attr("method", "get").submit();
				
			});
			
			var firstSelect = $("select[name='bsort']");
			var secondSelect = $("select[name='btag']");
			
			$(".board_write_sort_first").change(function(){
				
				console.log("changed");
				
				secondSelect.html("");
				
				if(firstSelect.val() == '음악'){

					secondSelect.append("<option value=''>테그를 선택해주세요</option>");
					secondSelect.append("<option value='K-pop'>K-pop</option>");
					secondSelect.append("<option value='빌보드'>빌보드</option>");
					secondSelect.append("<option value='J-pop'>J-pop</option>");
						
				}else if(firstSelect.val() == '지식'){
								
					secondSelect.append("<option value=''>테그를 선택해주세요</option>");
					secondSelect.append("<option value='일반상식'>일반상식</option>");
					secondSelect.append("<option value='역사'>역사</option>");
					secondSelect.append("<option value='수학'>수학</option>");
					secondSelect.append("<option value='영어'>영어</option>");
					
				}else if(firstSelect.val() == '컴퓨터'){
								
					secondSelect.append("<option value=''>테그를 선택해주세요</option>");
					secondSelect.append("<option value='하드웨어'>하드웨어</option>");
					secondSelect.append("<option value='소프트웨어'>소프트웨어</option>");
					secondSelect.append("<option value='주변기기'>주변기기</option>");
					
				}else if(firstSelect.val() == '커뮤니티'){
								
					secondSelect.append("<option value=''>테그를 선택해주세요</option>");
					secondSelect.append("<option value='일상'>일상</option>");
					secondSelect.append("<option value='유머'>유머</option>");
					secondSelect.append("<option value='모임'>모임</option>");
					
				}else if(firstSelect.val() == 'Q&A'){

					secondSelect.append("<option value=''>테그를 선택해주세요</option>");				
					secondSelect.append("<option value='코딩'>코딩</option>");
					secondSelect.append("<option value='일반'>일반</option>");
					secondSelect.append("<option value='아무이야기'>아무이야기</option>");
				}
				
			
			});
			
			
			
		});
		
	
	</script>	
	
	
</body>
</html>

					
						
						
						
				

	