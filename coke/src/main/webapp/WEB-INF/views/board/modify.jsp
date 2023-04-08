<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style type="text/css">
	
	
	
	
	
	.board_write_wrapper{
		width: 100%;
		margin-top: 1.5em;
		display: flex;
    	justify-content: center;
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
   		 width: 70%;
		border-radius: 8px;
		border: 1px solid #e5e7eb;
		padding: 10px;
	}
	
	.board_write_sort_second{
		width: 30%;
		border-radius: 8px;
		border: 1px solid #e5e7eb;
		padding: 10px;
	}
	
	.board_write_insert_btn{
	    display: flex;
    	justify-content: end;
    }
    
    #writePate_form{
    	width: 70%;
    }
    .uploadAtaachDiv{
    	display: none;
    }
	
	.modifyPate_btn{
		display: flex;
	    justify-content: end;
	}
	
	.mbtn{
		color: #3ab4e8;
	    border: 1px solid #3ab4e8;
	    padding: 6px;
	    border-radius: 8px;
	    background-color: white;
	    margin-right: 7px;
	}
	
</style>
				
		
		<div class="board_write_wrapper">	
		
			<form id="writePate_form" action="/board/modify_board" role="form" method="post">
			
				<div class="board_write_titleAndSort">
					
					<input class="board_write_title" type="text" name="btitle" value="${boardDto.btitle }" required>
			 		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			 		<div class="board_write_sort_wrapper" >
			 			<c:if test="${boardDto.bsort == '음악' }">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악" selected>음악</option>
							  	<option value="지식">지식</option>
							  	<option value="컴퓨터">컴퓨터</option>
							  	<option value="커뮤니티">커뮤니티</option>
							  	<option value="질문">Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>
							  	<option value='K-pop'>K-pop</option>
								<option value='빌보드'>빌보드</option>
								<option value='J-pop'>J-pop</option>							  	
						 	 </select>
			 			</c:if>
			 			<c:if test="${boardDto.bsort == '지식' }">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악">음악</option>
							  	<option value="지식" selected>지식</option>
							  	<option value="컴퓨터">컴퓨터</option>
							  	<option value="커뮤니티">커뮤니티</option>
							  	<option value="질문">Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>
							  	<option value='일반상식'>일반상식</option>
								<option value='역사'>역사</option>
								<option value='수학'>수학</option>
								<option value='영어'>영어</option>					  	
						 	 </select>
			 			</c:if>
			 			<c:if test="${boardDto.bsort == '컴퓨터' }">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악">음악</option>
							  	<option value="지식">지식</option>
							  	<option value="컴퓨터" selected>컴퓨터</option>
							  	<option value="커뮤니티">커뮤니티</option>
							  	<option value="질문">Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>
							  	<option value='하드웨어'>하드웨어</option>
								<option value='소프트웨어'>소프트웨어</option>
								<option value='주변기기'>주변기기</option>							  	
						 	 </select>
			 			</c:if>
			 			<c:if test="${boardDto.bsort == '커뮤니티' }">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악">음악</option>
							  	<option value="지식">지식</option>
							  	<option value="컴퓨터">컴퓨터</option>
							  	<option value="커뮤니티" selected>커뮤니티</option>
							  	<option value="질문">Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>
							  	<option value='일상'>일상</option>
								<option value='유머'>유머</option>
								<option value='모임'>모임</option>					  	
						 	 </select>
			 			</c:if>
			 			<c:if test="${boardDto.bsort == '질문' }">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악">음악</option>
							  	<option value="지식">지식</option>
							  	<option value="컴퓨터">컴퓨터</option>
							  	<option value="커뮤니티">커뮤니티</option>
							  	<option value="질문" selected>Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>
							  	<option value='코딩'>코딩</option>
								<option value='일반'>일반</option>
								<option value='아무이야기'>아무이야기</option>							  	
						 	 </select>
			 			</c:if>
			 			<c:if test="${empty boardDto.bsort}">
			 				<select class="board_write_sort_first" name="bsort" required>
							  	<option value="">게시판을 선택해 주세요</option>
							  	<option value="음악">음악</option>
							  	<option value="지식">지식</option>
							  	<option value="컴퓨터">컴퓨터</option>
							  	<option value="커뮤니티">커뮤니티</option>
							  	<option value="질문">Q&A</option>
					  		</select>
					  		<select class="board_write_sort_second" name="btag" required>
							  	<option value="">테그를 선택해주세요</option>							  	
						 	 </select>
			 			</c:if>
						  
			 		</div> <!-- board_write_sort_wrapper -->	
				</div> <!-- board_write_titleAndSort -->
			 
			  
		       <textarea name="bcontent" id="summernote" >${boardDto.bcontent }</textarea>
				<script>
				    $(document).ready(function() {
				    	
				    	var attachList = [];
				    	
				        $('#summernote').summernote({
				        	height: 500,
				        	callbacks:{				        		
								onImageUpload: function(files, editor, welEditable){						
			    		            for (var i = files.length - 1; i >= 0; i--) {
			    		            	console.log(files[i]);
			        		            uploadImageFile(files[i],this);								
									}
								}, // onImageUpload
								onMediaDelete : function(target) {
									
								      var fileName = target.attr('src');

								      fileName = fileName.substring(fileName.lastIndexOf('/')+1);
						            
								      console.log(fileName);
								      console.log("firstStep");
								      attachList.forEach(function(i){
								    	  
								    	  if(i == fileName){
								    		  
								    		  console.log("secondStep");
								    		  console.log("-------------");
								    		  console.log(i);
								    		  console.log(fileName);
								    		  
								    		  var targetIl = $("li[name='"+fileName+"']");
								    		  
								    		  console.log(targetIl);
								    		  
								    		  targetIl.remove();
								    	  }								    	  
								      });						
						         } //onMediaDelete
							} // callbacks
						}); // summbernote 
				        
						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";
				        
				        function uploadImageFile(file, el){
				        	
				        	var formData = new FormData();
				        	
				        	formData.append("uploadFile", file);
				        	
				        	$.ajax({				
				        		url: "/uploadAction",
				        		type: "POST",
				        		beforeSend: function(xhr){
				        			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				        		},
				        		data: formData,			        		
				        		cache:false,
				        		contentType:false,
				        		processData: false,
				        		enctype: 'multipart/form-data',			        		
				        		success:function(result){				        			
				        			$(result).each(function(index, dto){
				        				
				        				var fileCallPath = encodeURIComponent(dto.uploadPath + "/" +dto.uuid+ "_" +dto.fileName);				        				
				        				
										var formObj = $("form");				        										
				        				var str ="";				        				
				        				
				        				$('#summernote').summernote('insertImage', '/display?fileName='+fileCallPath);				        				
				        			
				        				formObj.append(str);
			        						
				        				});
				        			
				        			uploadImageLi(result);
				        			
				        		}				        		
				        	});
				        }	// uploadImageFile
				        
				        
				        
				        var attachUl = $(".uploadAttachUl");
						
						var bno = ${boardDto.bno};
						
						console.log(bno);
						
						$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
							
							console.log(arr);
							
							var str = "";
							
							$(arr).each(function(i, obj){
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
								
								console.log(fileCallPath)
								
								str += "<li name='display?fileName="+fileCallPath+"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-name='"+obj.fileName+"' data-type='"+obj.fileType+"'></li>";
								
								attachList.push("display?fileName="+fileCallPath);
							});
							console.log(attachList);
							attachUl.append(str);
						}); // getJSON
						
						
						function uploadImageLi(arr){
							
							var str ="";
							
							$(arr).each(function(i, obj){
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
								
								str += "<li name='display?fileName="+fileCallPath+"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-name='"+obj.fileName+"' data-type='"+obj.fileType+"'></li>";							
								
								attachList.push("display?fileName="+fileCallPath);
							});
							attachUl.append(str);
						}
				        
				        
				        
				    }); // the end 
				 </script>
			    	 

			   <div class="modifyPate_btn">
			   	<button class="mbtn motifyBTN" type="submit" data-oper="modify">수정</button>
				<button class="mbtn deleteBTN" type="button" data-oper="delete">삭제</button>
				<button class="mbtn listBTN" type="button" data-oper="list">리스트</button>
			  </div>
			  	<input type="hidden" name="bno" value="${boardDto.bno }">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				<input type="hidden" name="type" value="${cri.type }">
				<input type="hidden" name="keyword" value="${cri.keyword }">
			  	
			 	 <!-- temporary input hidden tag -->			  
			  	<input type="hidden" name="userid" value="${boardDto.userid }">
			  	<input type="hidden" name="nickname" value="tester3">
			</form> 
			
		<div class="uploadAtaachDiv">
			<ul class="uploadAttachUl">
			</ul>
		</div>	
		 	 
		</div> <!-- board_write_wrapper -->
	
	
		<%@ include file="../include/footer.jsp" %>
		
	</div> <!-- wrapper -->
	

	<script type="text/javascript">
		$(function(){
	
			var formObj = $("form");
			
			$(".mbtn").click(function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				if(operation == "delete"){
					
					if(!confirm("삭제하시겠습니까?")){
						
						return;
					}
					
					formObj.attr("action", "/board/delete");
					
				}else if(operation == "list"){
					
					formObj.attr("action", "/board/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var typeTag = $("input[name='type']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(typeTag);
					formObj.append(keywordTag);
					
				}else if(operation == "modify"){
					
					var str = "";
					
					$(".uploadAttachUl li").each(function(i, obj){
						
						var dataObj = $(obj);
						
						str += "<input type='hidden' name='getAttachList["+i+"].uploadPath' value='"+dataObj.data("path")+"'>"
						str += "<input type='hidden' name='getAttachList["+i+"].uuid' value='"+dataObj.data("uuid")+"'>"
						str += "<input type='hidden' name='getAttachList["+i+"].fileName' value='"+dataObj.data("name")+"'>"
						str += "<input type='hidden' name='getAttachList["+i+"].fileType' value='true'>"
						
					});
					formObj.append(str);				
				}
				
				formObj.submit();
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
					
				}else if(firstSelect.val() == '질문'){

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



	