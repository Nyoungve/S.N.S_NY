<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>S.N.S</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
   <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
 
    <!-- Theme CSS -->
    <link href="css/creative.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
    <script src="vendor/jquery/jquery.min.js"></script>
     <!-- 달력 -->
	<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!-- 달력 style 지정 -->	
   
	<style>
		.ui-datepicker{width:100%;font-size:30px;}
		.ui-datepicker select.ui-datepicker-month{width:100%;font-size:30px;}
		.ui-datepicker select.ui-datepicker-year{width:100%;font-size:30px;}
	</style>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>S.N.S 홈페이지 메인입니다.</title>
</head>
<body id="page-top">

<c:if test="${msg=='alert'}">
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요!^^");
	</script>
</c:if>
<c:if test="${msg=='logout'}">
	<script type="text/javascript">
		alert("로그아웃 되었습니다.");
	</script>
</c:if>
	<!-- tiles파일 -->
	<%@include file="tiles/navbar.jsp"%>
	<%@include file="tiles/header.jsp"%>
	<%@include file="tiles/body_main.jsp"%>
	<%@include file="tiles/modal_login.jsp"%>
	<%@include file="tiles/footer.jsp"%>
	
	 <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>
    <script src="js/index3.min.js"></script>
	
<button type="button" name="btn1" onclick="location.href='login.do'">로그인하기</button>

<a href="restaurantDetailView.do">레스토랑 상세페이지로 이동!</a>

</body>
</html>