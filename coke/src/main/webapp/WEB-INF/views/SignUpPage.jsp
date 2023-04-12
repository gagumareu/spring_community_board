<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ include file="include/header.jsp" %>


<style type="text/css">
	
	

	
	
	
	
</style>

		<div class="board_write_wrapper">
		
			<div>
				<h1>SignUp Page</h1>
			</div>
			
			<form action="/insertUser" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div>
					<input type="text" name="userid" placeholder="ID" autofocus="autofocus">
				</div>
				<div>
					<input type="password" name="userpw" placeholder="password">
				</div>
				<div>
					<input type="text" name="userName" placeholder="name">
				</div>
				
				<button type="submit">제출</button>
			</form>
			
		</div> <!-- board_write_wrapper -->
	
	
		
		
	</div> <!-- wrapper -->
	
	
	<%@ include file="include/footer.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var inputId = $("input[name='userid']").val();
			
			
		});	
	
	</script>
	
	
</body>
</html>

					
						
						
						
				

	