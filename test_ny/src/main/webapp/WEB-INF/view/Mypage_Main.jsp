<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<section id="reviewSection" style="height: 800px ">
    	<div class="container">
		<div class="col-lg-2 col-sm-2"></div>
		<div id="jemok" class="col-lg-10 col-sm-10"><h2>마이페이지</h2></div>
		
		<div id="menuList" class="col-lg-2 col-sm-2">
			<div class="row"><br/></div>
			<div class="row">
				<div id="button1" class="col-lg-2 col-sm-2">
				<button id="Mypage_ReserveBtn" type="button" class="btn btn-default btn-lg">예약현황</button>
				</div>
			</div>
			<div class="row"><br/></div>
			<div class="row">
				<div id="button2" class="col-lg-2 col-sm-2">
				<button id="Mypage_UserInfoBtn" type="button" class="btn btn-default btn-lg">정보수정</button>
				</div>
			</div>
			<div class="row"><br/></div>
			<div class="row">
				<div id="button3" class="col-lg-2 col-sm-2">
				<button id="Mypage_ReviewBtn" type="button" class="btn btn-default btn-lg">후기목록</button>
				</div>
			</div>
		</div>
		
  		<div id="resultTable" class="col-lg-10 col-sm-10"></div>
		</div>
		 	
		
	</section>
	

<script type="text/javascript">	

//예약현황
$(document).on('click','#Mypage_ReserveBtn',function() {

	alert("예약현황클릭")
	var url="Mypage_Reserve.do"
	var query="dup=userid";
	
	$.ajax({
		type:"GET"
		,url:url
		,data:query
		,success:function(arg){
			
			//제목을 바꾼다.
			$('#jemok').html("<h2>예약현황</h2>")
			
			//결과 테이블을 초기화한다.
			$('#resultTable').html("");
			
			//결과 테이블을 뿌려준다.
			$('#resultTable').html(arg);
			
		}
	 	,error:function(e){
		  console.log(e.responseText);
		 }
		
	})
	
})

// 예약 현황 더보기
var end_rno = 10 + Number(${end_rno})
	
$(document).on('click','#btn_more',function(){
	end_rno += 10
	var url = "Mypage_Reserve.do"
	var query = "end_rno="+end_rno
			
	$.ajax({
			
		type:"GET"
		,url:url
		,data:query
		,success:function(data){
					
			$('#resultTable').html("");
			$('#resultTable').append(data);
					
		}
			
		,error:function(e){
				console.log(e.responseText);
		}
				
	})
			
})



//정보수정

$(document).on('click','#Mypage_UserInfoBtn',function() {

	alert("정보수정클릭")
	
	var url="Mypage_UserInfo.do"
	var query="dup=userid";
	
	$.ajax({
		type:"GET"
		,url:url
		,data:query
		,success:function(arg){
			
			//제목을 바꾼다.
			$('#jemok').html("<h2>예약현황</h2>")
			
			//결과 테이블을 초기화한다.
			$('#resultTable').html("");
			
			//결과 테이블을 뿌려준다.
			$('#resultTable').html(arg);
			
			
			
		}
	 	,error:function(e){
		  console.log(e.responseText);
		 }
		
	})
	
})


//후기수정
$(document).on('click','#Mypage_ReviewBtn',function() {

	alert("후기버튼클릭")
	
	var url="Mypage_Review.do"
	var query="dup=userid";
	
	$.ajax({
		
		type:"GET"
		,url:url
		,data:query
		,success:function(arg){
			
			//제목을 바꾼다.
			$('#jemok').html("<h2>예약현황</h2>")
			
			//결과 테이블을 초기화한다.
			$('#resultTable').html("");
			
			//결과 테이블을 뿌려준다.
			$('#resultTable').html(arg);
			
			
		}
	 	,error:function(e){
		  console.log(e.responseText);
		 }
		
	})
	
})
</script>	
	
	
	