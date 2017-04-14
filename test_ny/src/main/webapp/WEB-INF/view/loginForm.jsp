<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath(); //첫번째 경로를 가져온다
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
    <!-- 여기서 모달출 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
    <script src="vendor/jquery/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#userid").val();
            var userPw = $("#password").val();
            if(userId == ""){
                alert("아이디를 입력하세요.!!!");
                $("#userId").focus(); // 입력포커스 이동
                return false; // 함수 종료
            }
            if(userPw == ""){
                alert("비밀번호를 입력하세요.!!!");
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
<!-- <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
    테스트입니다.                     
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-warning" id="testDel">
        전체삭제<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <span class="btn btn-sm btn-success" id="testSave">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div> -->
<!-- 내가 만든 로그인 폼 -->
<!-- header, body, footer설정  -->
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
							<script >
								alert("아이디 또는 비밀번호가 일치하지 않습니다.");
							</script>
						</c:if>
				</form:form>
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
<!-- 모달 로그인 끝 -->
</body>
</html>