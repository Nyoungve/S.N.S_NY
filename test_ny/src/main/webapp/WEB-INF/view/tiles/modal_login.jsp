<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath(); //첫번째 경로를 가져온다
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>  
	<title>로그인 </title>

	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#userid").val();
            var userPw = $("#password").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(userPw == ""){
                alert("비밀번호를 입력하세요.");
                $("#usePw").focus();
                return false;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.loginForm.action="<%=path%>/login.do";
            // 제출
            document.loginForm.submit();
        });
    });
</script>
</head>
<body>
<!-- 내가 만든 로그인 폼 -->
<div class="modal fade" id="Login" tabindex="-1" role="dialog"
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
				
				<form:form name="loginForm" commandName="loginForm" method="post">
				<input type="hidden" name="parentId" value="10" /> 
					
					<!-- 아이디: <input type="text" name="userid" id="userid" /><br/> -->
					<div class="form-group">
						<label for="username">아이디</label> <input name="userid" value=''
							id="userid" placeholder="UserID" type="text"
							class="form-control" required autofocus />
						<p id="id_value"></p>
					</div>
					
					<!-- 패스워드:<input type="password" name="password" id="password"/><br/> -->
					<div class="form-group">
						<label for="password">비밀번호</label> <input name="password"
							id="password" value='' placeholder="Password" type="password"
							class="form-control" required />
						<p id="pw_value"></p>
					</div>
					
					<!--<input type="submit" id="btnLogin" value="로그인"> -->
					<div class="form-group">
						<input type="submit" id="btnLogin" value="Login" />
					</div>
					
					<!-- <button>ID/PW찾기</button> -->
					<div class="form-group">
						<input type="button" class="btn btn-lg btn-primary btn-block"
							data-toggle="modal" data-target="#Find" value="ID/PW 찾기" />
					</div>
					
					<!-- <a href="join.do">회원이 아니세요? 회원가입하기</a> -->
					<div class="form-group">
						<input type="button" class="btn btn-lg btn-primary btn-block"
							data-toggle="modal" data-target="#SignUp" value="회원가입">
					</div>
					
						<c:if test="${msg=='failure'}">
							<!-- <script type="text/javascript">
								alert("아이디 또는 비밀번호가 일치하지 않습니다.");
							</script> -->
							<script >
								alert("아이디 또는 비밀번호가 일치하지 않습니다.");
							</script>
						</c:if>
						<c:if test="${msg=='logout'}">
							<script >
								alert("로그아웃 되었습니다.");
							</script>
						</c:if>
				</form:form>
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 로그인 끝 -->

<!-- 모달 로그인 시작
<div class="modal fade" id="Login" tabindex="-1" role="dialog"
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
 모달 로그인 끝 -->

<!-- 모달 ID/PW찾기 시작 -->
<div class="modal fade" id="Find" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">찾으시는 것을 선택해 주세요</h4>
			</div>
			<div class="modal-body">
				<form accept-charset="UTF-8" role="form" method="post" action="">
					<div class="form-group">
						<input type="button" class="btn btn-lg btn-primary btn-block"
							data-toggle="modal" data-target="#FindID" value="ID찾기">
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-lg btn-primary btn-block"
							data-toggle="modal" data-target="#FindPW" value="비밀번호 찾기" />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 모달 ID/PW찾기 끝 -->

<!-- 모달 ID찾기 시작 -->
<div class="modal fade" id="FindID" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">ID찾기</h4>
			</div>
			<div class="modal-body">
				<form accept-charset="UTF-8" role="form" method="post" action=""
					id="IDSearch">
					<div class="form-group">
						<input type="type" class="form-control" placeholder="이름을 입력해주세요."
							id="id" required autofocus>
					</div>
					<div class="form-group">
						<input type="type" class="form-control"
							placeholder="E-mail을 입력해주세요." id="email" required>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-lg btn-primary btn-block"
							value="ID 찾기" /><br>
						<p class="" id="IDResult"></p>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달 ID찾기 끝 -->

<!-- 모달 PW찾기 시작 -->
<div class="modal fade" id="FindPW" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">PW찾기</h4>
			</div>
			<div class="modal-body">
				<form accept-charset="UTF-8" role="form" method="post" action=""
					id="PWSearch">
					<div class="form-group">
						<input type="type" class="form-control" placeholder="이름을 입력해주세요."
							id="name" required autofocus>
					</div>
					<div class="form-group">
						<input type="type" class="form-control" placeholder="ID를 입력해주세요."
							id="id" required>
					</div>
					<div class="form-group">
						<input type="type" class="form-control"
							placeholder="E-mail을 입력해주세요." id="email" required>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-lg btn-primary btn-block"
							value="PW 찾기" /><br>
						<p id="PWResult"></p>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달 PW찾기 끝 -->

<!-- 모달 회원가입 시작 -->
<div class="modal fade" id="SignUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">회원가입</h4>
			</div>
			<div class="modal-body">
				<form accept-charset="UTF-8" role="form" method="post" action="" id="Validation">
					<div class="form-group">
						<label for="userid">아 이 디</label><br>
						<input name="userid" value='' id="userid" placeholder="아이디를 입력해주세요." type="text" class="form-joinButton" required autofocus />
						<input type="button" class="btn btn-lg btn-primary btn-block-jointext" value="ID Check" data-toggle="modal" data-target="#IDCheck">
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label><br>
						<input name="password" id="password1" value='' placeholder="비밀번호를 입력해주세요." type="password" class="form-joinButton" required />
					</div>
					<div class="form-group">
						<label for="password1">비밀번호 확인</label><br>
						<input name="password1" id="password2" value='' placeholder="비밀번호를 다시한번 입력해주세요" type="password" class="form-joinButton" required />
					</div>
					<div class="form-group">
						<label for="name">이&nbsp;&nbsp;름</label><br>
						<input name="name" value='' id="name" placeholder="이름을 입력해 주세요" type="text" class="form-joinButton" required />
					</div>
					<div class="form-group">
						<label for="mobile">전화번호</label><br>
						<input name="mobile" value='' id="mobile" placeholder="전화번호를 입력해 주세요 " type="text" class="form-joinButton" required />
					</div>
					<div class="form-group">
						<label for="E-mail">e-mail</label><br>
						<input name="E-mail" value='' id="E-mail" placeholder="이메일을 입력해 주세요" type="text" class="form-joinButton" required />
						<input type="button" class="btn btn-lg btn-primary btn-block-jointext" value="Send Code" data-toggle="modal" data-target="#Code">
					</div>
					<div class="form-group">
						<label for="code">인증번호</label><br>
						<input name="code" value='' id="code" placeholder="이메일로 받은 인증코드를 입력해 주세요" type="text" class="form-joinButton" required />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-lg btn-primary btn-block" value="회원가입" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 회원가입 끝 -->

<!-- 모달 IDCheck 시작 -->
<div class="modal fade" id="IDCheck" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">ID Check</h4>
			</div>
			<div class="modal-body">
				<div style="align-content: center">

					<!--ID Check  성공시 출력-->
					<p>사용할 수 있는 ID 입니다.</p>

					<!--ID Check  실패시 출력-->
					<p>
						중복되는 ID 입니다. <br> 다시 입력해 주세요.
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 IDCheck 시작 -->

<!-- 모달 인증코드 발송 시작 -->
<div class="modal fade" id="Code" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">인증코드</h4>
			</div>
			<div class="modal-body">
				<div style="align-content: center">
					<p>인증코드가 발송되었습니다.</p>
					<p>입력하신 E-mail을 확인해 주세요.</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 인증코드 발송 끝 -->
</body>
</html>