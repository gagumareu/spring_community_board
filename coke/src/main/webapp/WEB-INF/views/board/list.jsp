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
	
	</style>
		
		
		<div class="board_content">
			
			<div class="board_top_content">
				<div class="board_top_content_wrapper">
					<div class="board_top_content_register">
						<security:authorize access="isAuthenticated()">
							<c:if test="${pageMaker.cri.bsort eq null and pageMaker.cri.btag eq null}">
								<a href="/board/writeBoard?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">글 작성하기</a>
							</c:if>
							<c:if test="${!empty pageMaker.cri.bsort}">
								<a href="/board/writeBoard?bsort=${pageMaker.cri.bsort }&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">글 작성하기</a>
							</c:if>
							<c:if test="${!empty pageMaker.cri.btag}">
								<a href="/board/writeBoard?btag=${pageMaker.cri.btag }&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">글 작성하기</a>
							</c:if>
							
						</security:authorize>
						
					</div>
					
					<div class="board_top_content_tagSort">					
						<c:forEach items="${tagList }" var="dto">
							<c:if test="${dto != null }">
								<a class="tagLink" href="/board/list?btag=${dto }">${dto}</a>
							</c:if>						
						</c:forEach>
					</div>
				
					
					<div class="board_top_content_filter">
						 
					</div>
				</div>
			</div> <!-- board_top_content -->	
			
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
					
					<c:forEach items="${boardList }" var="dto">
						<div class="dto_list">
							<div class="board_list_title_wrapper">							
								
								<div class="board_list_nickName_wrapper">
									<div class="board_list_nickNameDiv"><a href="#">${dto.userid }</a></div>
									<div class="board_list_date" >
										<fmt:formatDate value="${dto.bregdate }" pattern="yyyy-MM-dd"/>
									</div>
									<div class="board_list_hit_wrapper">
										<div class="board_list_hit">
											<img src="/resources/upload/icon/view5.png">
											<div class="hitCounting" >${dto.bhit }</div>	
										</div>
										<div class="board_list_view">
											<img src="/resources/upload/icon/replyIcon.png"> 
											<div class="board_list_viewCounting">
												${dto.replycnt }
											</div>
										</div>
									</div> <!-- board_list_hit_wrapper -->
								</div>
								
								<a class="move" href="${dto.bno }">${dto.btitle }</a>
								
								<div class="tagOrsort">
									<c:if test="${empty pageMaker.cri.bsort }">
										<c:if test="${empty pageMaker.cri.btag }">	
											<a href="/board/list?bsort=${dto.bsort }">${dto.bsort }</a>
										</c:if>
										<c:if test="${!empty pageMaker.cri.btag }">	
											<a href="/board/list?btag=${dto.btag }">${dto.btag }</a>
										</c:if>			
									</c:if>								
									<c:if test="${!empty pageMaker.cri.bsort }">
										<a href="/board/list?btag=${dto.btag }">${dto.btag }</a>
									</c:if>	
								
								</div>					
							</div> <!-- board_list_title_wrapper -->
								
							
						</div> <!-- dto_list -->
	
					</c:forEach>
					<div class="board_paging">
						<ul>
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage -1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
									<a href="${num }">
										${num }
									</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1 }">
										Next
									</a>
								</li>
							</c:if>
						</ul>
					</div> <!-- board_paging -->
					
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<c:if test="${!empty pageMaker.cri.bsort }">
							<input type="hidden" name="bsort" value="${pageMaker.cri.bsort }">
						</c:if>
						<c:if test="${!empty pageMaker.cri.btag }">
							<input type="hidden" name="btag" value="${pageMaker.cri.btag }">
						</c:if>
					</form>
					
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
			<div class="board_search">
				<form id="searchForm" action="/board/list" method="get">
					<select class="searchInput" name="type">
						<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>-----</option>
						<option value="T" <c:out value="${pageMaer.cri.type eq 'T'?'selected':'' }" />>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }" />>내용</option>
						<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }" />>작성자</option>
						<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }" />>제목+내용</option>	
						<option value="TN" <c:out value="${pageMaker.cri.type eq 'TN'?'selected':'' }" />>제목+작성자</option>	
						<option value="TCN" <c:out value="${pageMaker.cri.type eq 'TCN'?'selected':'' }" />>제목+내용+작성자</option>	
					</select>
					<input class="searchInput" type="text" name="keyword" value="${pageMaker.cri.keyword }" placeholder="검색어 입력">
					<button class="searchBTN">SEARCH</button>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<c:if test="${!empty pageMaker.cri.bsort }">
						<input type="hidden" name="bsort" value="${pageMaker.cri.bsort }">
					</c:if>
					<c:if test="${!empty pageMaker.cri.btag }">
						<input type="hidden" name="btag" value="${pageMaker.cri.btag }">
					</c:if>
				</form >
			</div>
		</div> <!-- board_content -->
	
		
		
		
	</div> <!-- wrapper -->
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		
		$(".paginate_button a").on("click", function(e){
			
			console.log('click');
			
			e.preventDefault();
						
			actionForm.find("input[name='pageNum']")
			.val($(this).attr("href"));			
						
			actionForm.submit();

		
		});
			
		
		$(".move").click(function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"' >");
			actionForm.attr("action", "/board/read_board");
			actionForm.submit();
			
		});
		
		$(".sideTitleToReading").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/read_board");
			actionForm.submit();
			
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").click(function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
			
		});
		
		
	});
	

	
	
	</script>	
	
	
</body>
</html>

					
						
						
						
				

	