<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

		<tr>
			<td colspan="5" align="center">
				<form id='searchForm' action="/post" method='get'>
					<select name='type'>
						<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
						<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
						<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
						<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
					</select> <input type='text' name='keyword' value="${pageMaker.cri.keyword}"> 
									<input type='hidden' name='page' value="${pageMaker.cri.page}"> 
									<input type='hidden' name='perPageNum' value="${pageMaker.cri.perPageNum}">
					<button class='btn btn-default'>Search</button>
				</form>
			</td>
		</tr>

		<tr>
			<td id="pagenate" colspan="5" align="center"><c:if test="${pageMaker.prev }">
					<a href="${pageMaker.startPage-1}">이전</a>
				</c:if> <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="i">
					<c:choose>
						<c:when test="${pageMaker.cri.page==i}">${i }</c:when>
						<c:otherwise>
							<a href="${i }">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${pageMaker.next }">
					<a href="${pageMaker.endPage+1 }">다음</a>
				</c:if></td>
		</tr>
	</table>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="${pageMaker.cri.page}" /> 
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />
	<input type="hidden" name="type" value="${pageMaker.cri.type }"> 
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

<script src="/js/list.js"></script>

<%@include file="../include/footer.jsp"%>