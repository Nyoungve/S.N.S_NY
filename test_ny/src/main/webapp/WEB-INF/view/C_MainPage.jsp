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
<title>S.N.S 고객 메인페이지 입니다.</title>
</head>
<body id="page-top">
	<c:if test="${msg=='success'}">
		<script type="text/javascript">
			alert("로그인 성공!");
		</script>
	</c:if>
	<!-- 네이게이션 바 시작 -->
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">S.N.S</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <div class="nav navbar-nav navbar-right btn-group btn-group-lg" role="group" aria-label="Large button group">
					<b>${loginForm.userid}</b>님 환영합니다.<button type="button" name="btn1" onclick="location.href='logout.do'">로그아웃하기</button>
					<!-- <input type="button" class="page-scroll btn btn-info btn-lg" data-toggle="modal" data-target="#Logout" value="Logout"> -->
                    <input type="button" id="myPage" class="page-scroll btn btn-info btn-lg" value="MyPage" style="margin-right: 100px">
                </div>
            </div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 네이게이션 바 끝 -->
	<!-- 모달 로그아웃 -->
	<div class="modal fade" id="Logout" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					<form accept-charset="UTF-8" role="form" method="post" action=""
						id="LoginForm">
						<div class="form-group">
							<label for="username">아이디</label> <input name="user_id" value=''
								id="username" placeholder="UserID" type="text"
								class="form-control" required autofocus />
							<p id="id_value"></p>
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								id="password" value='' placeholder="Password" type="password"
								class="form-control" required />
							<p id="pw_value"></p>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-primary btn-block"
								value="Login" />
						</div>
						<div class="form-group">
							<input type="button" class="btn btn-lg btn-primary btn-block"
								data-toggle="modal" data-target="#Find" value="ID/PW 찾기" />
						</div>
						<div class="form-group">
							<input type="button" class="btn btn-lg btn-primary btn-block"
								data-toggle="modal" data-target="#SignUp" value="회원가입">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
 	<!--모달 로그아웃 끝 -->
	<!-- tiles파일 -->
	<%@include file="tiles/header.jsp"%>
	<%@include file="tiles/body_main.jsp"%>
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