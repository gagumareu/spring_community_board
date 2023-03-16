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
							조회: ${BoardVO.bhit }
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
					<textarea id="summernote" required > </textarea>
					<script>
					    $(document).ready(function() {
					        $('#summernote').summernote({
					        	height: 100,
					            
					        	   
					        });
					    });
					  </script>
					  <div class="board_read_reply_insert_wrapper">
						<button class="replyAddBtn" type="button">댓글 작성</button>  
					  </div>
					
				</form>
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
		
	
		
		
	
	</script>
	
	
	<script type="text/javascript">
		
	
	
	
	</script>	
	
	
</body>
</html>



	