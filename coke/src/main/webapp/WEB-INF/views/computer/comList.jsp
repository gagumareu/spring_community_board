<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

	
	<style type="text/css">
		.dto_list{
			padding: 10px;
			justify-content: space-between;
			display: flex;
			flex-direction: row;
			border-bottom: 1px solid #e5e7eb;
			height: 90px;
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
			font-size: 1.3em;
		}
		
		.board_list_hit_wrapper{
			display: flex;
	   		flex-direction: row;
	    	align-items: center;
		}
		
		.board_list_view{
		    margin-left: 20px;
			color: #00a3d2;
			display: flex;
    		flex-direction: row;
		}
		
		.board_list_view img{
			width: 25px;
		}
		
		.board_list_hit{
		    display: flex;
   			flex-direction: row;
   			color: #00a3d2;	
		}
		
		.board_list_hit img {
			width: 25px;
		}
		
		.hitCounting{
			align-self: center;
		
		}
		
		.board_list_viewCounting{
			align-self: center;
			margin-left: 5px;
		}
		
		
	</style>
		
		
		<div class="board_content">
			<div class="board_top_content">
				<div class="board_top_content_register">
					<a href="/computer/comInsert">글 작성하기</a>
				</div>
				<div class="board_top_content_tagSort">
					<div class="tag_btn">
						<a href="/board/list?tag=일상">일상</a>
					</div>
					<div class="tag_btn">
						<a href="/board/list?tag=유머">유머</a>
					</div>
					<div class="tag_btn">
						<a href="/board/list?tag=모임">모임</a>
					</div>
				</div>
				<div class="board_top_content_filter">
					필터
				</div>
				
			</div>
			<div class="board_search">
				<form id="searchForm" action="/board/list" method="get">
					<select name="type">
					
					</select>
					<button>SEARCH</button>
					
				</form >
			</div>
			
			<div class="board_content_wrapper">
			
				
				
				<div class="board_content_list">
						
					<c:forEach items="${ComList }" var="dto">
						<div class="dto_list">
							<div class="board_list_title_wrapper">
								<div class="board_list_nickName_wrapper">
									<div class="board_list_nickNameDiv"><a href="#">${dto.nickname }</a></div>
									<div class="board_list_date" >
										<fmt:formatDate value="${dto.bregdate }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								<a class="move" href="${dto.bno }">${dto.btitle }</a>
								<div class="board_list_sort"><a href="#">${dto.btag }</a></div>
							</div> <!-- board_list_title_wrapper -->
								
							<div class="board_list_hit_wrapper">
								<div class="board_list_hit">
									<img src="/resources/upload/icon/hitCounting.png">
									<div class="hitCounting" >${dto.bhit }</div>	
								</div>
								<div class="board_list_view">
									<img src="/resources/upload/icon/replyIcon.png"> 
									<div class="board_list_viewCounting">
										${dto.replycnt }
									</div>
								</div>
							</div>
						</div> <!-- dto_list -->
	
					</c:forEach>
					
					
					<div class="board_paging">
						<ul>
							
						</ul>
					</div> <!-- board_paging -->
					
					<form id="actionForm" action="/board/list" method="get">
						
					</form>
					
				</div> <!-- board_content_list -->
				
			
			</div> <!-- board_content_wrapper -->
		</div> <!-- board_content -->
	
	
		<div class="footer">
			<p>
			
			</p>
		</div> <!-- footer -->
		
	</div> <!-- wrapper -->

	

	<script type="text/javascript">
		$(document).ready(function(){	
			
			$(".insertBtn").on("click", function(e){
			
				
				location.href="/computer/insert";
				
			});
			
			
		});
	
	
	</script>

<%@ include file="../include/footer.jsp" %>

	
</body>
</html>