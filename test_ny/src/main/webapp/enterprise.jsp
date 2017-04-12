<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="kr">

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
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">
<!-- 네비 메뉴 시작 -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
				<a class="navbar-brand page-scroll" href="#page-top">S.N.S</a>
            </div>

            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
<!-- 네비 메뉴 끝->
<!-- 헤더 시작 -->
    <header style=" background-image:url(img/Enterprise_header.jpg)">
        <div class="header-content row">
           <div class="header-content-inner col-md-4" >
               <h1 id="homeHeading">S.N.S<br/><small>Stop no Show<br> 레스토랑 예약<br> 프로그램!!</small></h1>
            </div>
            <div class="header-content-inner col-md-4" style="margin:0 auto">
            <form accept-charset="UTF-8" role="form" method="post" action="">
				<div class="form-group">
					<label for="username">아이디</label>
					<input name="user_id" value='' id="username" placeholder="UserID" type="text" class="form-control" required autofocus/>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label>
					<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" required />
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-lg btn-primary btn-block" value="Login" />
				</div>
			</form>
            </div>
            
        </div>
        
    </header>
<!-- 헤더 끝-->

<a href='ownerMain.do?restaurant_number=0101'>업주마이페이지</a>
    <!-- footer 추가 -->	
	<%@include file="WEB-INF/view/tiles/footer.jsp"%>
    
    
	<!-- 모달 로그인 시작 -->
	<div class="modal fade" id="Login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">로그인</h4>
			</div>
			<div class="modal-body">
			<form accept-charset="UTF-8" role="form" method="post" action="">
				<div class="form-group">
					<label for="username">아이디</label>
					<input name="user_id" value='' id="username" placeholder="UserID" type="text" class="form-control" required autofocus/>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label>
					<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" required />
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-lg btn-primary btn-block" value="Login" />
				</div>
					<input type="button" class="btn btn-lg btn-primary btn-block" value="비밀번호 찾기" />
				<hr />
				<div class="form-group">
					<a href="sign_up.html" class="btn btn-default btn-block m-t-md">회원가입</a>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	  </div>
	</div>
	<!-- 모달 로그인 끝 -->	
	
	
	<!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>
	
</body>

</html>
    