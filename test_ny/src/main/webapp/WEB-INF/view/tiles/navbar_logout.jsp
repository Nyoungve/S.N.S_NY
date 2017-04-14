<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
           					 
					<p><span style="font-size:20px;background-color:white;"><b>${loginForm.userid}</b>님 환영합니다.</span></p>
                    <!-- Logout버튼 --> 
                    <input type="button" class="page-scroll btn btn-info btn-lg" value="로그아웃" onclick="location.href='logout.do'">
                 	<!-- MyPage버튼 -->
                    <input type="button" id="myPage" class="page-scroll btn btn-info btn-lg" value="MyPage">
                </div>
            </div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- 네이게이션 바 끝 -->