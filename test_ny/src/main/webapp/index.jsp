<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

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
    <!-- 여기서 모달출력함 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
    <script src="vendor/jquery/jquery.min.js"></script>
	
	<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script>

$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal({
        	remote : 'layer.jsp'
        });
    })
})

</script>
<style type="css/text">

</style>
</head>
<body>
	<h2>Hello World!</h2><br>
	<a href="main.do">레스토랑 메인페이지로 이동</a><br>
	 <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

 모달폼 띄워보기 예제 
<button class="btn btn-default" id="popbutton">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
     <!--  header -->
      <div class="modal-header">
     <!--    닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        header title
        <h4 class="modal-title">Header</h4>
      </div>
      body
      <div class="modal-body">
       Body
      </div>
      Footer
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달폼 띄워보기  -->
<a data-toggle="modal" href="login.do" data-target="#modal-testNew" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">테스트 등록</span>
</a>
 
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>

</body>

</html>