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
		
			<form action="/board/register_board" role="form" method="post">
			
				<div class="board_write_titleAndSort">
					
					<input class="board_write_title" type="text" name="btitle" placeholder="제목을 입력하세요." required>
			 		
			 		<div class="board_write_sort_wrapper" >
			 			<select class="board_write_sort_first" name="bsort" required>
						  	<option value="">토픽을 선택해 주세요</option>
						  	<option value="음악">음악</option>
						  	<option value="지식">지식</option>
						  	<option value="컴퓨터">컴퓨터</option>
						  	<option value="Q&A">Q&A</option>
						  	
					  	</select>
						  <select class="board_write_sort_second">
						  	<option>test</option>
						  </select>
			 		</div> <!-- board_write_sort_wrapper -->	
				</div> <!-- board_write_titleAndSort -->
			 
			  
		       <textarea name="bcontent" id="summernote" required > </textarea>
				<script>
				    $(document).ready(function() {
				        $('#summernote').summernote({
				        	height: 300,
				        	callbacks:{
				        		
								onImageUpload: function(files, editor, welEditable){						
			    		            for (var i = files.length - 1; i >= 0; i--) {
			    		            	console.log(files[i]);
			        		            uploadImageFile(files[i],this);
								
										}
									} // onImageUpload
									
								}
							});
				        function uploadImageFile(file, el){
				        	
				        	var formData = new FormData();
				        	
				        	formData.append("uploadFile", file);
				        	
				        	$.ajax({				
				        		url: "/uploadAction",
				        		type: "POST",
				        		data: formData,				        		
				        		cache:false,
				        		contentType:false,
				        		processData: false,
				        		enctype: 'multipart/form-data',			        		
				        		success:function(result){
				        			//$(el).summernote('editor.insertImage', data.url);
				        			
				        			$(result).each(function(index, dto){
				        				
				        				var fileCallPath = encodeURIComponent(dto.uploadPath + "/" +dto.uuid+ "_" +dto.fileName);				        				
				        				
										var formObj = $("form");
				        										
				        				var str ="";				        				
				        				
				        				$('#summernote').summernote('insertImage', '/display?fileName='+fileCallPath);				        				
				        			
				        				formObj.append(str)
			        						
				        				});	
				        		}
				        		
				        	});
				        }	 
				       
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
	
		$(document).ready(function(e){
			
			var formObj = $("form");
			
			$("#cancelBtn").on("click", function(e){
				
				console.log("test okay");
				
				formObj.attr("action", "/board/list").attr("method", "get");
				
				formObj.submit();
				
			});
			
		});
	
	
	</script>	
	
	
</body>
</html>

					
						
						
						
				

	