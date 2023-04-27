<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="../include/header.jsp" %>

<link href="/resources/css/writePage.css" type="text/css" rel="stylesheet">

<div class="board_write_wrapper">

	<form class="writeForm" role="form" action="/board/register_board" role="form" method="post">
	
		<div class="board_write_titleAndSort">
			
			<input class="board_write_title" type="text" name="btitle" placeholder="제목을 입력하세요." required="required" autofocus="autofocus">
	 		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
	 		<input type="hidden" name="userid" value='<security:authentication property="principal.username"/>'>
	 		
	 			 		
	 		<div class="board_write_sort_wrapper" >
	 			<c:if test="${bsort == '음악' }">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악" selected>음악</option>
					  	<option value="지식">지식</option>
					  	<option value="컴퓨터">컴퓨터</option>
					  	<option value="커뮤니티">커뮤니티</option>
					  	<option value="질문">Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>
					  	<option value='K-pop'>K-pop</option>
						<option value='빌보드'>빌보드</option>
						<option value='J-pop'>J-pop</option>							  	
				 	 </select>
	 			</c:if>
	 			<c:if test="${bsort == '지식' }">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악">음악</option>
					  	<option value="지식" selected>지식</option>
					  	<option value="컴퓨터">컴퓨터</option>
					  	<option value="커뮤니티">커뮤니티</option>
					  	<option value="질문">Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>
					  	<option value='일반상식'>일반상식</option>
						<option value='역사'>역사</option>
						<option value='수학'>수학</option>
						<option value='영어'>영어</option>					  	
				 	 </select>
	 			</c:if>
	 			<c:if test="${bsort == '컴퓨터' }">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악">음악</option>
					  	<option value="지식">지식</option>
					  	<option value="컴퓨터" selected>컴퓨터</option>
					  	<option value="커뮤니티">커뮤니티</option>
					  	<option value="질문">Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>
					  	<option value='하드웨어'>하드웨어</option>
						<option value='소프트웨어'>소프트웨어</option>
						<option value='주변기기'>주변기기</option>							  	
				 	 </select>
	 			</c:if>
	 			<c:if test="${bsort == '커뮤니티' }">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악">음악</option>
					  	<option value="지식">지식</option>
					  	<option value="컴퓨터">컴퓨터</option>
					  	<option value="커뮤니티" selected>커뮤니티</option>
					  	<option value="질문">Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>
					  	<option value='일상'>일상</option>
						<option value='유머'>유머</option>
						<option value='모임'>모임</option>					  	
				 	 </select>
	 			</c:if>
	 			<c:if test="${bsort == '질문' }">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악">음악</option>
					  	<option value="지식">지식</option>
					  	<option value="컴퓨터">컴퓨터</option>
					  	<option value="커뮤니티">커뮤니티</option>
					  	<option value="질문" selected>Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>
					  	<option value='코딩'>코딩</option>
						<option value='일반'>일반</option>
						<option value='아무이야기'>아무이야기</option>							  	
				 	 </select>
	 			</c:if>
	 			<c:if test="${empty bsort}">
	 				<select class="board_write_sort_first" name="bsort" required="required">
					  	<option value="">게시판을 선택해 주세요</option>
					  	<option value="음악">음악</option>
					  	<option value="지식">지식</option>
					  	<option value="컴퓨터">컴퓨터</option>
					  	<option value="커뮤니티">커뮤니티</option>
					  	<option value="질문">Q&A</option>
			  		</select>
			  		<select class="board_write_sort_second" name="btag" required="required">
					  	<option value="">테그를 선택해주세요</option>							  	
				 	 </select>
	 			</c:if>
				  
	 		</div> <!-- board_write_sort_wrapper -->	
	 		
	 	<input class="board_write_title" type="text" name="nickname" value="${userName }" readonly="readonly">
	 		
		</div> <!-- board_write_titleAndSort -->
	 
	  
       <textarea name="bcontent" id="summernote" required > </textarea>
		<script>
		    $(document).ready(function() {
		    	
		    	var imageList = [];
		    				    				    										
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
						      console.log(imageList);
						      
						      imageList.forEach(function(i){
						    	  
						    	  console.log("getToHereFirst");
						    	  console.log(i);
						    	  console.log(fileName);
						    	  
						    	  
						    	  if(i == fileName){
						    		  
						    		  console.log("getToHereSecond");
						    		  
						    		  var fileToDelete = $("li[name='"+fileName+"']");
						    		  
						    		  console.log(fileToDelete);
						    		  
						    		  fileToDelete.remove();
						    	  }								    	  
						      });									
				             }	// onMediaDelete
						} // callbacks
					}); //summernote
		        
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
		        			console.log(result);
		        			uploadResult(result);				        			
		        		}				        		
		        	});
		        }	 // uploadImageFile		
		        				       				        						        				        			
       			function uploadResult(arr){
       				 
			        var uploadUL = $(".uploadImageUl");		        			
        			var str ="";	
        			
        			$(arr).each(function(i, dto){
        						        				
        				var fileCallPath = encodeURIComponent(dto.uploadPath + "/" +dto.uuid+ "_" +dto.fileName);				        				

						console.log(fileCallPath);
															        			        							        				
        				$('#summernote').summernote('insertImage', '/display?fileName='+fileCallPath);				        				
        				
        				str += "<li name='display?fileName="+fileCallPath+"' data-path='"+dto.uploadPath+"'"
        				str +=	"	data-uuid='"+dto.uuid+"' data-fileName='"+dto.fileName+"' data-type='"+dto.image+"'></li>"
        						        				
        				imageList.push("display?fileName="+fileCallPath);	        									        				
        				
        			});		
        			
        			uploadUL.append(str);
        			
        			console.log(imageList);        				
       				
       			} // uploadResult ernd				        
		    });
		 </script>
	    	 

	  <div class="board_write_insert_btn">
	  	<button id="uploadBtn" type="submit">작성</button>
	  	<button id="cancelBtn">취소</button>
	  </div>
	  
	</form>
	
	<form action="/board/list" method="get" id="backToListForm">
		<c:if test="${bsort != null }">
 			<input type="hidden" name="bsort" value="${bsort }">
 		</c:if>
 		<c:if test="${btag != null }">
 			<input type="hidden" name="btag" value="${btag }">
 		</c:if>
 		<input type="hidden" name="pageNum" value="${cri.pageNum }">
 		<input type="hidden" name="amount" value="${cri.amount }">
	</form>
	
	<div class="uploadImagesDiv">
		<ul class="uploadImageUl">
		
		</ul>
	</div>
</div> <!-- board_write_wrapper -->
	
</div> <!-- wrapper -->
	
<%@ include file="../include/footer.jsp" %>
	
<script type="text/javascript">

	$(document).ready(function(e){
		
		var formObj = $("form[role='form']");
		
		var backForm = $("#backToListForm");
		
		var sort = null;
		var tag = null;
		
		var sort = "${bsort}";
		var tag = "${btag}";
		
		
		
		$("#cancelBtn").on("click", function(e){
			
			e.preventDefault();
			
			backForm.submit();
			
			//console.log("test okay");
			
			//formObj.attr("action", "/board/list").attr("method", "get");
			
			//formObj.submit();
			
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
		
	var inputDvi = $(".board_write_titleAndSort");
	
	var title = $(".board_write_title").val();
	
	$("#uploadBtn").on("click", function(e){
		
		e.preventDefault();
		console.log("clicked");
		
		var str = "";
		
		$(".uploadImagesDiv ul li").each(function(i, obj){
			
			var dataObj = $(obj);
			
			console.log("-----------------------");
			console.log(dataObj.data("path"));
			console.log(dataObj.data("uuid"));
			console.log(dataObj.data("filename"));
			console.log(dataObj.data("type"));
			
			str += "<input type='hidden' name='getAttachList["+i+"].uploadPath' value='"+dataObj.data("path")+"'>"
			str += "<input type='hidden' name='getAttachList["+i+"].uuid' value='"+dataObj.data("uuid")+"'>"
			str += "<input type='hidden' name='getAttachList["+i+"].fileName' value='"+dataObj.data("filename")+"'>"
			str += "<input type='hidden' name='getAttachList["+i+"].fileType' value='"+dataObj.data("type")+"'>"
			
		});
		console.log(str);
		
		
		
		if(!inputDvi.find("[name='btitle']").val()){
			alert("제목을 입력하세요.");
			return false;
		}
		
		
		formObj.append(str).submit();
	});	
		
		
		
		
		
	});


</script>	
	
	
</body>
</html>

					
						
						
						
				

	