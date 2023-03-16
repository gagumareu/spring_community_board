<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   

<%@ include file="../include/header.jsp" %>

<style>	

	.reply_boxes{
		padding:0px;
		
	}
	
	.reply_box{
		padding: 24px 0px 24px 0px;
		border-bottom: 1px solid #e5e7eb;
	}
	
	.board_read_reply_wrapper{
		padding: 30px;
	    border: 1px solid #e5e7eb;
	    border-radius: 8px;
		
	}
	
	.reply_modal{
		display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
	}
	
	.reply_modal_content{
		
	  background-color: #fff;
	  margin: 10% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;

	}
	
	.reply_modal_close {
	  color: #aaa;
	  /*float: right;*/
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.reply_modal_btn:hover,
	.reply_modal_btn:focus {
	   color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.board_member_info{
		margin-bottom: 3.3em;
	    margin-top: 1.7em;
	    display: flex;
    	justify-content: space-between;
	}
	
	.board_read_memInfo_wrapper{
		display: flex;
		flex-direction: column;
		
	}
	
	.board_read_member_dateAndHit{
		display: flex;
		flex-direction: row;
	}
	
	
	
	.board_member_nickNmae{
		font-size: 1.3em;
	    font-weight: 600;
	
	}
	
	.board_read_title_wrapper{
		margin-bottom: 3em;
	}
	
	.board_read_content_wrapper{
		margin-bottom: 5em;
	}
	
	
	.board_read_reply_insert_wrapper{
		display: flex;
		justify-content: end;
	
	}
	
	.uploadImageDiv{
		display: none;
	}
	
</style>

		
		
		<div class="board_content">		
			<div class="board_member_info">					
				<div class="board_read_memInfo_wrapper">
					<div class="board_member_nickNmae">
						<a href="#">${BoardVO.nickname }</a>
					</div>
					<div class="board_read_member_dateAndHit">
						<div>
							<c:if test="${BoardVO.bregdate == BoardVO.bupdate }">
								등록일: <fmt:formatDate value="${BoardVO.bregdate }" pattern="yyyy-MM-dd" />	
							</c:if>
							<c:if test="${BoardVO.bregdate != BoardVO.bupdate }">
								수정일: <fmt:formatDate value="${BoardVO.bupdate }" pattern="yyyy-MM-dd"/>	
							</c:if>
						</div>
						<div>
							조회: ${BoardVO.bhit } ${BoardVO.bno }
						</div>
					</div>
					
				</div>	<!-- board_read_memInfo_wrapper -->
				<div class="board_read_btn_wrapper">
					<button class="m_btn">수정</button>
					<button class="l_btn">리스트</button>
				</div>
						
			</div>
			
			
			<div class="board_read_title_wrapper">
				<h1>${BoardVO.btitle }</h1>
			</div>
			
			<div class="board_read_content_wrapper">
				${BoardVO.bcontent }
			</div>
			
			<form action="/board/modify" method="get" class="actionForm">
				<input type="hidden" name="bno" value="${BoardVO.bno }" class="bno"> 
				<input type="hidden" name="pageNum"	 value="${cri.pageNum }">
				<input type="hidden" name="amount"	 value="${cri.amount }">
				<input type="hidden" name="type"	 value="${cri.type }">
				<input type="hidden" name="keyword"	 value="${cri.keyword }">
			</form>
			
			<div class="board_read_reply_wrapper">
				<form class="replyForm">
					<input class="replyer" name="replyer" type="hidden" value="tester3">
					<textarea id="summernote" name="reply" required> </textarea>
					<script>
					    $(document).ready(function() {
					    	
					    	var uploadedImageList = [];
					    						    
					        $('#summernote').summernote({
					        	height: 100,
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
					        
					        
					        
					    }); // the end
					  </script>
					  <div class="board_read_reply_insert_wrapper">
						<button class="replyAddBtn" type="button">댓글 작성</button>  
					  </div>
					
				</form>
			</div>
				
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
					<div class="reply_modal_replyer"><input type="text" name="replyer"></div>
					<div class="reply_modal_date"><input type="text" name="replydate"></div>
					<textarea id="summernote2"> </textarea>
					<script>
					    $(document).ready(function() {
					        $('#summernote2').summernote({
					        	
					        });
					    });
				 	 </script>
					<span class="reply_modal_btn modifyBtn">modify</span>
					<span class="reply_modal_btn removeBtn">remove</span>
					<span class="reply_modal_btn closeBtn">close</span>
				</div>
			</div>
		
			
		</div> <!-- board_content -->
	
	
		<div class="footer">
			<h3>HellO World</h3>
			<h3>HellO World</h3>
			<h3>HellO World</h3>
			<h3>HellO World</h3>
		</div> <!-- footer -->
		
	</div> <!-- wrapper -->
	
	
	<script type="text/javascript" src="/resources/js/board_reply.js"></script>
	
		
	<script type="text/javascript">
		
	
		$(document).ready(function(){
			
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
						str += "<li class='reply_box' data-rno='"+list[i].rno+"'>";
						str += "	<strong class='reply_writer'>"+list[i].replyer+"</strong>";
						str += "	<small class='reply_date'>"+replyService.displayTime(list[i].replydate)+"</small>"
						str += "	<div class='reply_content'>"+list[i].reply+"</div>";
						str += "</li>"
					}
					
					replyUL.html(str);
				});
				
				
			} // showList end
			
			var replyForm = $(".replyForm");
			var replyerValue = replyForm.find("input[name='replyer']");
			var replyValue = replyForm.find("textarea[name='reply']");
			
			var replyBtn = $(".replyAddBtn");
		
			console.log("bno: " + bnoValue);
						
			replyBtn.on("click", function(e){
				
				console.log("-----------------------");
				e.preventDefault();
					
				var editorValue = $('#summernote').summernote('code');
			    
				var summernoteEditor = $('#summernote').summernote();
				
				var imageList = [];
				
				var str = "";
				
				$(".uploadImageDiv ul li").each(function(i, obj){
				
				str += {uploadPath: obj.uploadPath};
				str += {uuid: obj.uuid};
				str += {fileName: obj.fileName};	
				str += {fileType: 'true'};	
						
				
				
				//	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+obj.uploadPath+"'>"
				//	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+obj.uuid+"'>"
				//	str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+obj.fileName+"'>"
				//	str += "<input type='hidden' name='attachList["+i+"].fileType' value='true'>"
				imageList.push(str);	
				});
				
				
				
				console.log(imageList);
				
			    var reply = {
						reply: editorValue,
						replyer: replyerValue.val(),
						bno: bnoValue,
						attachList: imageList
				};
				
		//	    if(!replyForm.find("input[name=replyer]").val()){
		//			alert("작성자를 입력하세요");
		//			return false;
		//		}
						
			    if ($.trim(editorValue) === '') {
			        alert('Please enter some content');
			        return false; // prevent the form from being submitted
			        //$('.replyForm').load('my-url.php');

			      }
			    summernoteEditor.summernote('reset');
			    
				replyService.add(reply, function(result){
					
					// reset the editor
					
					showList(1);
				});
					

			}); // add end
			
			var replyModifyBtn = $(".modifyBtn");
			var replyDeleteBtn = $(".removeBtn");
			
			var modal = $("#reply_modal");
						
			var summernoteEditor2 = $("#summernote2").summernote('code');
			var replyModalWriter = modal.find("input[name='replyer']");
			var replyModalReply = modal.find("textarea[name='reply']");
			var replyModalDate = modal.find("input[name='replydate']");
			
			$(".reply_boxes").on("click", "li", function(e){
				
				//$(this).html("");
				
				//var str = "";
				
				//var replyBox = $(this).html();
				
				var rno = $(this).data('rno');
				
				console.log(rno);
				
				$("#reply_modal").show();
				
				replyService.get(rno, function(param){
					
					console.log("rno: " + param.rno);
					console.log("replyer: " + param.replyer);
					console.log("reply: " + param.reply);
					console.log("replydate : " + param.replydate);
					
					var reply = param.reply;
					
					modal.data("rno", param.rno);
										
					replyModalWriter.val(param.replyer).attr("readonly", "readonly")
					replyModalReply.val(param.reply);
					replyModalDate.val(replyService.displayTime(param.replydate)).attr("readonly", "readonly");
					
					$("#summernote2").summernote('code', param.reply);
					
				});
				
				$(".closeBtn").click(function(){
					$("#reply_modal").hide();
				})
				
			}); // get end
			
			replyDeleteBtn.on("click", function(e){
				
				var rno = modal.data("rno");
				
				console.log("rno: " + rno);
				
				replyService.remove(rno, function(result){
					
					alert(result);
					$("#reply_modal").hide();
					showList(1);
				});
				
			}); // remove end
		
			
			replyModifyBtn.on("click", function(e){
				
				var replyValue = $("#summernote2").summernote('code', modal.data("reply"));
				
				var reply = {rno: modal.data("rno"), reply: replyValue};
				
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
				
				$(".l_btn").click(function(){
					actionForm.find(".bno").remove();
					actionForm.attr("action", "/board/list").submit();
				});
				
			});
			
			
			
			
		}); // the end
		
	
	</script>
	

	
</body>
</html>



	