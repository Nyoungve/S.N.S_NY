<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>

<meta charset="utf-8">
<!--호환성 보기: http://webdir.tistory.com/38 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--content="너비를 장치너비로 설정, 초기화면배율 설정(Zoom 레벨 설정)": http://aboooks.tistory.com/352-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>datepicker</title>

<!--bootstrap 설정 시작-->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--bootstrap 설정 끝-->


<!--jQuery 설정 시작-->
<!--// jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<!--// jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!--// jQuery UI 라이브러리 js파일-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!--jQuery 설정 끝-->

<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<link rel="stylesheet" href="css/datepicker.css">




<style type="text/css">
.Highlighted a{

   background-color : red !important;

   background-image :none !important;

   color: White !important;

   font-weight:bold !important;

   font-size: 12px;

}
</style>







</head>

<!-- body 시작 -->
<body id="page-top">

<!-- 메뉴 -->
<%@include file="menu.jsp"%>

<br/><br/><br/>
<!-- 헤더 시작 -->
	<header>
		<div class="container-fluid">
		
		<div class="header-content">
		
		<!-- 옆에 버튼들 -->
		<%@ include file="buttons.jsp"%>
		
		
	    <!-- 여백 -->
		<div class="header-content-inner col-md-1"></div>
		
		
		<!-- 버튼을 클릭하면 나오는 바디 내용 부분 -->
		<div class="header-content-inner col-md-6">
		
		
		<div id="calendar"></div>
		<div id="divBox"></div>
		
		</div>
		
		
		
		<!-- 여백 -->
		<div class="header-content-inner col-md-3"></div>
		</div>
		
		
		</div>
		
	
		
	</header>
	<!-- 헤더 끝-->


	<!-- footer 추가 -->
	<%@include file="/WEB-INF/view/tiles/footer.jsp"%>

<!-- 로딩용 이미지  시작-->
<div id="loadingLayout" style="display:none; position:absolute; left:0px; top: 0px; width: 100%; height: 100%; background: #eee; z-index: 9000;" >
<img id="loading" src="loading.gif" border="0">
</div>
<!-- 로딩용 이미지  끝-->

</body>


</html>
