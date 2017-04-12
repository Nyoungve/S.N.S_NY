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
					<input type="button" class="page-scroll btn btn-info btn-lg" data-toggle="modal" data-target="#Login" value="Login" onclick="location.href='login.do'">
                    <input type="button" class="page-scroll btn btn-info btn-lg" data-toggle="modal" data-target="#SignUp" value="SingUp">
                    
                    <!-- myPage 버튼은 로그인 안됬을때는 안보이도록 하는법 찾아보는 중 ...C_MainPage로 넘겨줌-->
                   <!--  <input type="button" id="myPage" class="page-scroll btn btn-info btn-lg" value="MyPage" style="margin-right: 100px"> -->
                </div>
            </div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- 네이게이션 바 끝 -->