<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> �̸��� ���� V(^_^)V !!</title>

<script type="text/javascript">
function check(){
	
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert('������ȣ�� �Է��ϼ���.');
		return false;
	}
	
	if(form.authnum.value!=authNum){
		alert('Ʋ�� ������ȣ�Դϴ�. ������ȣ�� �ٽ� �Է����ּ���');
		form.authnum.value=="";
		return false;
	}
	
	if(form.authnum.value==authNum){
		alert('���������Ϸ�!!');
		opener.document.joinForm.mailCheck.value="���������Ϸ�!!";
		self.close(); 
		return false;
	}
}
</script>

</head>
<body>

<h5>������ȣ 7�ڸ��� �Է��ϼ���</h5>
	<div class="container">
		<form method="post" name="authenform" onsubmit="return check();">
			<input type="text" name="authnum"><br> 
			<input type="submit" class="btn btn-info" value="Submit">
		</form>
	</div>
</body>
</html>