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
                    
                    <!-- a태그로 login.do로 get으로 url요청 -->
                    <a data-toggle="modal" href="login.do" data-target="#Login" role="button" data-backdrop="false" class="page-scroll btn btn-info btn-lg">
 						로그인
					</a>

					<!-- 내가 만든 로그인 폼 content까지만 등록-->
					<div id="Login" class="modal fade" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
							modal_login.jsp에  header, body, footer 작성하기
							</div>
						</div>
					</div>
					
					<!-- 모달 로그인 끝 -->
                    <!-- <input type="button" class="page-scroll btn btn-info btn-lg" data-toggle="modal" data-target="#SignUp" value="SingUp"> -->
                	<!-- a태그로 login.do로 get으로 url요청 -->
                    <a data-toggle="modal" href="join.do" data-target="#SignUp" role="button" data-backdrop="false" class="page-scroll btn btn-info btn-lg">
 						회원가입
					</a>
					<!-- 내가 만든 회원가입 폼 content까지만 등록-->
					<div class="modal fade" id="SignUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
							modal_login.jsp에  header, body, footer 작성하기
						</div>
					</div>
					<!-- 모달 회원가입 끝 -->
                </div>
            </div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- 네이게이션 바 끝 -->