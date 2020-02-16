<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post" items="${posts}">
				<tr>
					<td>${post.id}</td>
					<td><a href="/post/detail/${post.id}">${post.title}</a></td>
					<td>${post.username}</td>
					<td>${post.createDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<tr>
			<td colspan="5" align="center">
			<c:if test="${pageMaker.prev }">
					<a href="${pageMaker.startPage-1 }">이전</a>
				</c:if> 
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
					<c:choose>
						<c:when test="${pageMaker.cri.page==i }">${i }</c:when>
						<c:otherwise><a href="${i }">${i }</a></c:otherwise>
					</c:choose>
				</c:forEach> 
				<c:if test="${pageMaker.next }">
					<a href="${pageMaker.endPage+1 }">다음</a>
				</c:if>
				</td>
		</tr>
</div>

<!-- <script src="/js/list.js"></script> -->

<%@include file="../include/footer.jsp"%>