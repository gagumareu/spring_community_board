	<div class="footer">
		<p>
		<c:forEach items="${memberList }" var="member">
			<div>${member.mname }</div>
			<div>${member.email }</div>
		</c:forEach>
		</p>
	</div> <!-- footer -->