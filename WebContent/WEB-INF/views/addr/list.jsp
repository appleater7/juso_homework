<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label for="ad_dong">읍면동 : </label>
	<input type="text" name="ad_dong" id="ad_dong" value="${ad_dong}">
	<button onclick="search()">검색</button>
	<select name="pageCount" onchange="changePageCount(this)">
		<option value="10" <c:if test="${pageCount==10 }">
selected
</c:if>>10</option>

		<option value="20" <c:if test="${pageCount==20 }">
selected
</c:if>>20</option>

		<option value="30" <c:if test="${pageCount==30 }">
selected
</c:if>>30</option>

		<option value="40" <c:if test="${pageCount==40 }">
selected
</c:if>>40</option>

		<option value="50" <c:if test="${pageCount==50 }">
selected
</c:if>>50</option>

	</select>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>시도</th>
			<th>구군</th>
			<th>동</th>
			<th>리</th>
			<th>번지</th>
			<th>호</th>
		</tr>
		<c:forEach items="${list }" var="addr">
			<tr>
				<td>${addr.ad_num }</td>
				<td>${addr.ad_sido }</td>
				<td>${addr.ad_gugun }</td>
				<td>${addr.ad_dong }</td>
				<td>${addr.ad_lee }</td>
				<td>${addr.ad_bunji }</td>
				<td>${addr.ad_ho }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" align="center"><c:if test="${1!=page}">
					<a href="/addr/list?page=1&pageCount=${pageCount}&ad_dong=${param.ad_dong}">◀</a>
				</c:if> <c:if test="${page>=11}">
					<a href="/addr/list?page=${page-10}&pageCount=${pageCount}&ad_dong=${param.ad_dong}">◁</a>
				</c:if> <c:forEach var="p" begin="${fBlock}" end="${lBlock}">
					<c:if test="${p==page}">
						<b>[${p}]</b>
					</c:if>
					<c:if test="${p!=page}">
						<a href="/addr/list?page=${p}&pageCount=${pageCount}&ad_dong=${param.ad_dong}">[${p}]</a>
					</c:if>
				</c:forEach> <c:if test="${(totalPageCnt-10)>=page}">
					<a href="/addr/list?page=${page+10}&pageCount=${pageCount}&ad_dong=${param.ad_dong}">▷</a>
				</c:if> <c:if test="${totalPageCnt!=page}">
					<a href="/addr/list?page=${totalPageCnt}&pageCount=${pageCount}&ad_dong=${param.ad_dong}">▶</a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="7" align="right">총 갯수 : ${totalCnt}</td>
		</tr>
	</table>

	<script>
		function changePageCount(obj) {
			location.href = "/addr/list?page=${page}&pageCount=" + obj.value;
		}
		function search() {
			var ad_dong = document.querySelector('#ad_dong').value;
			location.href = "/addr/list?pageCount=${pageCount}&ad_dong="
					+ ad_dong;
		}
	</script>
</body>
</html>
