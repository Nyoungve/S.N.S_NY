<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 이메일 인증 V(^_^)V !!</title>

<script type="text/javascript">
function check(){
	
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert('인증번호를 입력하세요.');
		return false;
	}
	
	if(form.authnum.value!=authNum){
		alert('틀린 인증번호입니다. 인증번호를 다시 입력해주세요');
		form.authnum.value=="";
		return false;
	}
	
	if(form.authnum.value==authNum){
		alert('메일인증완료!!');
		opener.document.joinForm.mailCheck.value="메일인증완료!!";
		self.close(); 
		return false;
	}
}
</script>

</head>
<body>

<h5>인증번호 7자리를 입력하세요</h5>
	<div class="container">
		<form method="post" name="authenform" onsubmit="return check();">
			<input type="text" name="authnum"><br> 
			<input type="submit" class="btn btn-info" value="Submit">
		</form>
	</div>
</body>
</html>