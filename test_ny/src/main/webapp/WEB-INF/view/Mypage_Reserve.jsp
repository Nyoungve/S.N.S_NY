<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="toDay" class="java.util.Date" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function writeForm(restaurant_number, reserve_date) {
		url = "writeForm.do?restaurant_number="+restaurant_number+"&reserve_date="+reserve_date;
		window.open(url,"post","toolbar=no ,width=350 ,height=600 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
	
</script>
<!-- 결과 테이블 -->

<table class="table">
	<thead>
		<tr>
			<th>예약일자</th>
			<th>업체명</th>
			<th>상태창</th>
			<th>예약취소</th>
			<th>후기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="reserveList" items="${reserveList}">
			<tr>
				<td><fmt:formatDate value="${reserveList.reserve_date}"
						var="reserve_date" type="both" pattern="yyyy-MM-dd HH:mm" />
					${reserve_date}</td>
				<td>${reserveList.e_name}</td>
				<td><c:if test="${reserveList.r_state==1}">
										승인대기
									</c:if> <c:if test="${reserveList.r_state==2}">
										예약완료
									</c:if> <c:if test="${reserveList.r_state==3}">
										취소요청
									</c:if> <c:if test="${reserveList.r_state==4}">
										이용완료
									</c:if> <c:if test="${reserveList.r_state==5}">
										취소완료
									</c:if></td>
				<td><fmt:parseDate value="${reserve_date}" var="reDay"
						pattern="yyyy-MM-dd HH:mm" /> <c:if
						test="${reDay.time - toDay.time > 0}">
						<c:if test="${reserveList.r_state==1 or reserveList.r_state==2}">
							<input type="button" id="btn_cancel" class="btn btn-info btn-sm" value="Cancel">
						</c:if>
					</c:if></td>
				<td><fmt:parseDate value="${reserve_date}" var="reDay"
						pattern="yyyy-MM-dd HH:mm" /> <c:if
						test="${reDay.time - toDay.time < 0}">
						<c:if test="${reDay.time - toDay.time > -3*(1000*60*60*24)}">
							<input type="button" id="btn_write" class="btn btn-info btn-sm" value="Write"  onclick="writeForm('${reserveList.restaurant_number}','${reserve_date}')">
						</c:if>
					</c:if></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<input type="button" id="btn_more" class="btn btn-info btn-sm" value="더 보기">
