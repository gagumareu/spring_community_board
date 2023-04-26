<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="../include/header.jsp" %>
<link href="/resources/css/read.css" type="text/css" rel="stylesheet">

<div class="board_content">		
	<div class="board_member_info">					
		<div class="board_read_memInfo_wrapper">
			<div class="board_member_nickNmae">
				<div class="board_read_sort">
					<a href="/board/list?bsort=${BoardVO.bsort }">${BoardVO.bsort }</a> / <a href="/board/list?btag=${BoardVO.btag }">${BoardVO.btag }</a>
				</div>
				<a class="board_read_userid" href="#">${BoardVO.userid }</a>
			</div>
			<div class="board_read_member_dateAndHit">
				<div>
					<c:if test="${BoardVO.bregdate == BoardVO.bupdate }">
						<fmt:formatDate value="${BoardVO.bregdate }" pattern="yyyy-MM-dd"/>	
					</c:if>
					<c:if test="${BoardVO.bregdate != BoardVO.bupdate }">
						<fmt:formatDate value="${BoardVO.bupdate }" pattern="yyyy-MM-dd"/>	
					</c:if>
				</div>
				<div>
					<img class="read_board_hit_img" src="/resources/upload/icon/view5.png"> ${BoardVO.bhit } 
				</div>
			</div>
			
		</div>	<!-- board_read_memInfo_wrapper -->
		
				
	</div>
	
	
	<div class="board_read_title_wrapper">
		<h1>${BoardVO.btitle }</h1>
	</div>
	
	<div class="board_read_content_wrapper">
		${BoardVO.bcontent }
	</div>
	<div class="board_read_btn_wrapper">
		<security:authentication property="principal" var="prin"/>
		<security:authorize access="isAuthenticated()">
			<c:if test="${prin.username eq BoardVO.userid }">
				<button class="m_btn button">수정</button>	
			</c:if>
		</security:authorize>
		<button style="margin-left: 10px" class="list_btn button">리스트</button>
	</div>
	<form action="/board/modify" method="get" class="actionForm">
		<input type="hidden" name="bno" value="${BoardVO.bno }" class="bno"> 
		<input type="hidden" name="pageNum"	 value="${cri.pageNum }">
		<input type="hidden" name="amount"	 value="${cri.amount }">
		<input type="hidden" name="type"	 value="${cri.type }">
		<input type="hidden" name="keyword"	 value="${cri.keyword }">
		<c:if test="${!empty cri.bsort }">
			<input type="hidden" name="bsort" value="${cri.bsort }">
		</c:if>
		<c:if test="${!empty cri.btag }">
			<input type="hidden" name="btag" value="${cri.btag }">
		</c:if>
	</form>
	
	<security:authorize access="isAuthenticated()">
	
	<div class="board_read_reply_wrapper">
		<form class="replyForm">
			<textarea id="summernote" name="reply" required> </textarea>
			<script>
			    $(document).ready(function() {
			    	
			    	var uploadedImageList = [];
			    						    
			        $('#summernote').summernote({
			        	height: 170,
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
							      console.log(uploadedImageList);
							      
							      uploadedImageList.forEach(function(i){
							    	  
							    	  if(i == fileName){
							    		  var targetLi = $("li[name='"+fileName+"']");
							    		  console.log(targetLi);
							    		  targetLi.remove();
							    	  }
							      }); // forEach end
							      									
							}	// onMediaDelete end
			            }  // callbacks end
			        }); // summernote end
			        
			        function uploadImageFile(file, el){
			        	
			        	var formData = new FormData();
			        	
			        	formData.append("multipartFiles", file);
			        	
			        	$.ajax({
			        		url: "/replyUploadAction",
			        		type: 'POST',
			        		data: formData,
			        		cashe: false,
			        		contentType: false,
			        		processData: false,
			        		enctype: 'multipart/form-data',
			        		success: function(result){
			        			console.log(result);
			        			uploadImageOnEditor(result);
			        		}
			        	});					        					        				        	
			        }// uploadImageFile end
			        
			        function uploadImageOnEditor(arr){
			        	
			        	var imageUL = $(".uploadImageUl");
			        	
			        	var str ="";
			        	
			        	$(arr).each(function(i, obj){
			        						        							        		
			        		var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			        		
			        		$('#summernote').summernote('insertImage', '/displyReply?fileName='+fileCallPath);
			        		
			        		str += "<li name='displyReply?fileName="+fileCallPath+"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-name='"+obj.fileName+"' data-type='true'></li>"
			        				
			        		uploadedImageList.push("displyReply?fileName="+fileCallPath);		
			        	});				       
			        	
			        	imageUL.append(str);
			        	
			        }// uploadImageOnEditor
			        
			        
			        
			    }); // the end
			  </script>
			  <div class="board_read_reply_insert_wrapper">
			  	<button class="replyAddBtn" type="button">댓글 작성</button>					  						
			  </div>				
		</form>
	</div>
	
	
	</security:authorize>
	<security:authorize access="isAnonymous()">
		<div>
			<div class="need_new_reply">
				<span>댓글을 작성하려면 <a href="/LoginPage">로그인</a>이 필요합니다.</span>
			</div>
			
		</div>
	</security:authorize>
	
	<div class="uploadImageDiv">
		<ul class="uploadImageUl">
		</ul>	
	</div>
		
	<div class="reply_wrapper">
		<ul class="reply_boxes">
			<li class="reply_box" data-rno="">
				<div class="reply_contents">
					<strong class="reply_writer"></strong>
					<small class="reply_date"></small>
					<div class="reply_content"></div>							
				</div>					
			</li>
		</ul>
	</div>
	
	<div id="reply_modal" class="reply_modal">
		<div class="reply_modal_content">
			<input type="hidden" name="replyer" value="">
			<textarea id="summernote2"> </textarea>
			<script>
			    $(document).ready(function() {
			        $('#summernote2').summernote({
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
							      console.log(uploadedImageList);
							      
							      uploadedImageList.forEach(function(i){
							    	  
							    	  if(i == fileName){
							    		  var targetLi = $("li[name='"+fileName+"']");
							    		  console.log(targetLi);
							    		  targetLi.remove();
							    	  }
							      }); // forEach end
							      									
							}	// onMediaDelete end
			            }  // callbacks end					            
			        }); // summernote end
			        
					function uploadImageFile(file, el){
			        	
			        	var formData = new FormData();
			        	
			        	formData.append("uploadFile", file);
			        	
			        	$.ajax({
			        		url: "/uploadAction",
			        		type: 'POST',
			        		data: formData,
			        		cashe: false,
			        		contentType: false,
			        		processData: false,
			        		enctype: 'multipart/form-data',
			        		success: function(result){
			        			console.log(result);
			        			uploadImageOnEditor(result);
			        		}
			        	});					        					        				        	
			        }// uploadImageFile end
			        
			        function uploadImageOnEditor(arr){
			        	
			        	var imageUL = $(".uploadImageUl");
			        	
			        	var str ="";
			        	
			        	$(arr).each(function(i, obj){
			        						        							        		
			        		var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			        		
			        		$('#summernote').summernote('insertImage', '/display?fileName='+fileCallPath);
			        		
			        		str += "<li name='display?fileName="+fileCallPath+"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-name='"+obj.fileName+"' data-type='true'></li>"
			        				
			        		uploadedImageList.push("display?fileName="+fileCallPath);		
			        	});				       
			        	
			        	imageUL.append(str);
			        	
			        }// uploadImageOnEditor
			        
			    });  // document end
		 	 </script>
			<span class="reply_modalist_btn modifyBtn">modify</span>
			<span class="reply_modalist_btn removeBtn">remove</span>
			<span class="reply_modalist_btn closeBtn">close</span>
		</div>
	</div>

	
</div> <!-- board_content -->
	

</div> <!-- wrapper -->

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/board_reply.js"></script>

	
<script type="text/javascript">
	

$(document).ready(function(){
	
	var replyer = null;
	
	<security:authorize access="isAuthenticated()">
	
	replyer = '<security:authentication property="principal.username"/>';
	
	</security:authorize>
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	console.log("replyer by loginPerson: " + replyer);

	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	var bnoValue = ${BoardVO.bno};
	var replyUL = $(".reply_boxes");
	
	console.log("bno by BoardVO: " + ${BoardVO.bno});
	
	
	showList(1);
	
	function showList(page){
		
		replyService.getList({bno:bnoValue, page:page||1}, function(list){
			
			console.log(list);
			
			var str = "";
			
			if(list == null || list.length == 0){
				replyUL.html("<h3>첫 댓글이 없습니다.</h3>");
			}
			
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<li class='reply_box' data-rno='"+list[i].rno+"' data-bno='"+bnoValue+"'>";				
				str += "	<div class='reply_box_info'><div><strong class='reply_writer'>"+list[i].replyer+"</strong>";
				str += "	<small class='reply_date'>"+replyService.displayTime(list[i].replydate)+"</small></div>";
				//str += "    <button id='rmbtn'>수정</div></button>";
				str += "    </div>";
				str += "	<div class='reply_content'>"+list[i].reply+"</div>";
				//str += "	<div class='reply_reReply'><a href='#'>댓글 달기</a></div>";
				str += "</li>";
			}
			
			replyUL.html(str);
		});
		
		
	} // showList end
	
	var replyForm = $(".replyForm");
	var replyerValue = replyForm.find("input[name='replyer']");
	var replyValue = replyForm.find("textarea[name='reply']");
	var replyImageUploadUL = $(".uploadImageUl");
	var replyBtn = $(".replyAddBtn");

	console.log("bno: " + bnoValue);
	console.log("login user: " + replyer);
				
	replyBtn.on("click", function(e){
		
		e.preventDefault();
		
		console.log("-----------------------");			
			
		var editorValue = $('#summernote').summernote('code');		    
		var summernoteEditor = $('#summernote').summernote();
		var attachList = [];
		var replyInsertForm = $("#replyUploadInsertForm");
		
		$(".uploadImageDiv ul li").each(function(i, obj){
			
			console.log(obj);
			
			var dataObj = $(obj);
			
			var uploadPath = dataObj.data("path");
			var uuid = dataObj.data("uuid");
			var fileName = dataObj.data("name");
			var fileType = dataObj.data("type");
			var bno = bnoValue;
			
			console.log(uploadPath);
			console.log(uuid);
			console.log(fileName);
			console.log(fileType);								
			console.log(bno);
			
			var list = {uploadPath, uuid, fileName, fileType, bno};
			
			attachList.push(list);
		});		
		
		console.log(attachList);
		
		
		var reply = {
				replyer: replyer,
				reply: editorValue,
				bno: bnoValue,
				attachList: attachList
		}
		
		replyService.add(reply, function(result){
			
			//alter(result);
			
			 if ($.trim(editorValue) === '') {
		        alert('Please enter some content');
		        return false; // prevent the form from being submitted
		      }

			showList(-1);
		});
		replyImageUploadUL.html("");
		summernoteEditor.summernote('reset');
	}); // add end
	
	var replyModifyBtn = $(".modifyBtn");
	var replyDeleteBtn = $(".removeBtn");
	
	var modal = $("#reply_modal");
				
	var summernoteEditor2 = $("#summernote2").summernote('code');
	var replyModelReplyer = modal.find("input[name='replyer']");
	var replyModalReply = modal.find("textarea[name='reply']");
	var replyModalDate = modal.find("input[name='replydate']");
	
	$("#rmbtn").on("click", function(e){
		console.log("clicked");
	});
	$(".reply_boxes").on("click", "li", function(e){
		
		var rno = $(this).data('rno');
		
		console.log("reply rno: " + rno);
		
		$("#reply_modal").show();
		
		replyService.get(rno, function(param){
							
			if(!replyer){
				alert("로그인 사용자만 수정가능합니다.");
				$("#reply_modal").hide();
				return;
			}
			
			if(replyer != param.replyer){
				alert("댓글 등록자만 수정가능합니다.");
				$("#reply_modal").hide();
				return;
			}
			
			console.log("bno: " + param.bno);
			console.log("rno: " + param.rno);
			console.log("replyer: " + param.replyer);
			console.log("reply: " + param.reply);
			console.log("replydate : " + param.replydate);
			
			var reply = param.reply;
			
			modal.data("rno", param.rno);
			modal.data("bno", param.bno);
								
			
			replyModalReply.val(param.reply);
			replyModalDate.val(replyService.displayTime(param.replydate)).attr("readonly", "readonly");
			
			
			$("#summernote2").summernote('code', param.reply);
			modal.find("input[name='replyer']").val(param.replyer);
		});
		
		$(".closeBtn").click(function(){
			$("#reply_modal").hide();
		})
		
	}); // get end
	
	replyDeleteBtn.on("click", function(e){
		
		var originalReplyer = replyModelReplyer.val();
		
		var rno = modal.data("rno");
		var bno = modal.data("bno");
		
		console.log("rno: " + rno);
		console.log("bno: " + bno);
		console.log("originalReplyer: " + originalReplyer);
		
		if(!replyer){
			alert("로그인 후 서비스 가능합니다.");
			$("#reply_modal").hide();
			return;
		}
		
		if(originalReplyer != replyer){
			alert("댓글 등록자만 삭제 가능합니다.");
			$("#reply_modal").hide();
			return;
		}
		
		replyService.remove(rno, originalReplyer, function(result){
			
			alert(result);
			$("#reply_modal").hide();
			showList(1);
		});
		
	}); // remove end

	
	replyModifyBtn.on("click", function(e){
		
		var originalReplyer = replyModelReplyer.val();
		
		console.log("originalReplyer: " + originalReplyer);
		
		if(!replyer){
			alert("로그인시 사용가능한 서비스입니다.");
			$("#reply_modal").hide();
			return;
		}
		
		if(replyer != originalReplyer){
			alert("댓글 작성자만 수정이 가능합니다.");
			$("#reply_modal").hide();
			return;
		}
		
		var replyValue = $("#summernote2").summernote('code', modal.data("reply"));
		
		var reply = {
				rno: modal.data("rno"),
				replyer: originalReplyer,
				reply: replyValue
				};
		
		replyService.update(reply, function(result){
			
			$("#reply_modal").hide();
			showList(1);
		});
		
	});
	
	$(function(){
		var actionForm = $(".actionForm");
		
		$(".m_btn").click(function(){
			actionForm.attr("action", "/board/modify").submit();
		});
		
		$(".list_btn").click(function(){
			actionForm.find(".bno").remove();
			actionForm.attr("action", "/board/list").submit();
		});
		
	});
	
	
	
	
}); // the end
	

</script>
	

	
</body>
</html>



	