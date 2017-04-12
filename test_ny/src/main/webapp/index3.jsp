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
    
</head>

<body id="page-top">
  
    <%@include file="WEB-INF/view/tiles/navbar.jsp"%>
	<%@include file="WEB-INF/view/tiles/header.jsp"%>
	<%@include file="WEB-INF/view/tiles/body_main.jsp"%>
	<%@include file="WEB-INF/view/tiles/modal_login.jsp"%>
	<%@include file="WEB-INF/view/tiles/footer.jsp"%>
    
	
    
    
    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>
    <script src="js/index3.min.js"></script>
    
    
    <!-- 지도 사용을 위한 스크립트 추가 -->
    <!-- parsing block 에러는 소스가 너무 커서 네트워크가 느릴 때에는 보여지지 않을 수 있다는 것을 의미 -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=6341df44f6867a64500e499940c61c9a&libraries=services"></script>
    
    <!-- 결제 요청을 위한 스크립트 추가 -->
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    

	<!-- 내가 입력한 javascirpt -->
	<script type="text/javascript">
	
	//더보기 버튼
	$('#more').on('click',function(){
		
		var url='more.do'
		var query='dum=1';
		
		$.ajax({
			 type:"GET"
			 ,url:url
			 ,data:query
			 ,success:function(data){
				
			  $('#portfolio').append(data); 
			  
			 }
			 ,error:function(e){
			  console.log(e.responseText);
			 }
		})
	})
	
	//레스토랑 예약 요청
	$('#restaurant1').on('click',function(){
		//alert('asdf');
	
		//id가 포트폴리오인 곳 초기화
		$('#portfolio').html("");
	
		//더 찾기 버튼 없애기
		$('#moreBtn').remove();
		
		//오늘 날짜 구하기
		var now = new Date();
   	    var year= now.getFullYear();
    	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
         
    	//날짜 형식을 yyyy-mm-dd 로 만듬
        var today = year + '-' + mon + '-' + day;
      

    	// 레스토랑의 정보를 불러 올 때 레스토랑 번호와 오늘 날짜를 보내줘야한다.
		var url="reserve.do";
		var query="restaurant_number=0101"+"&today="+today;
		
		$.ajax({
			 type:"GET"
			 ,url:url
			 ,data:query
			 ,success:function(data){
			
			//셀렉션 태그 id= portfolio 인 곳에 data를 text 형식으로 집어 넣는다.
			  $('#portfolio').html(data); 
			  
			 }
			 ,error:function(e){
			  console.log(e.responseText);
			 }
			
		})
		
	})
	
	//마이페이지 요청
	$('#myPage').on('click',function(){
	
		$('#portfolio').html("");
		$('#moreBtn').remove();
		
		var url="Mypage_Main.do"
		var query="dup=userid";
		
		$.ajax({
			type:"GET"
			,url:url
			,data:query
			,success:function(arg){
				
				//셀렉션 태그 id= portfolio 인 곳에 data를 text 형식으로 집어 넣는다.
				$('#portfolio').append(arg);
				
			}
		 	,error:function(e){
			  console.log(e.responseText);
			 }
			
		})
		
	})
	
	</script>
	

</body>

</html>
    