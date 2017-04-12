<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%> 
<jsp:useBean id="sys" class="java.util.Date"/>
<fmt2:formatDate value="${sys}" pattern="yyyy-mm-dd" var="sysdate"/>

<!-- 달력 표시를 위한 스크립트 -->
<script type="text/javascript">

//예약 시간
var reserveTime = null;



//달력 설정
$.datepicker.regional['ko'] = {
		closeText: '닫기'
		,prevText: '이전달'
		,nextText: '다음달'
		,currentText: '오늘'
		,monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)']
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		,dayNames: ['일','월','화','수','목','금','토']
		,dayNamesShort: ['일','월','화','수','목','금','토']
		,dayNamesMin: ['일','월','화','수','목','금','토']
		,weekHeader: 'Wk'
		,dateFormat: 'yy-mm-dd',firstDay: 0
		,isRTL: false
		,showMonthAfterYear: true
		,yearSuffix: ''};


$.datepicker.setDefaults($.datepicker.regional['ko']);


//이전 날짜 막는 메소드


//달력과 시간 입력 단추 설정
$(function(){
	  
	
	$( "#testDatepicker" ).datepicker({
		minDate: 0
	 	,onSelect: function(dateText) {
	 		
	 		//버튼에 날짜를 속성값으로 넣어줌.
	 		$('.timeBlock').attr("data-reserveDate",dateText)
	 		
	 	}
			
	})
	 
	  
	  //시간 입력 단추 보이기
	  $('#btn1').on('click',function(){
		  
		  var isHidden = $('#div1').is(":hidden");
			
			if(isHidden){
				$('#div1').show(100); //파라미터는 걸리는 시간.
			}else {
				$('#div1').hide(100);
			}
		  
	  });
	  
	  //시간 입력 단추 중 하나값만 받아오기
	  $('.timeBlock').on('click',function(){
		 
		  $('.timeBlock').css('background', '');
		  
		  $(this).css("background-color","red");
		   
		 reserveTime = $(this).attr("date-reserveTime");
		   
		   
	  })
	  
	  //sub 단추를 눌렀을 때(예약 신청)
	  
	  $('#sub').on('click',function(){
		  
		  checkValue();
	  })
	  
	  $('#btn3').on('click',function(){
		  alert('asdf')
		  test();
	  })
	  
	  
	  
})  //document.ready 끝


function test(){
		
	
		var restaurant_number="0101"
		var reserve_date = $( "#testDatepicker" ).val() +" "+reserveTime
        var userid="a"
        var deposit =  $('#people').val() *10000;
		var r_state = 1
		var teamCount= $('#people').val()
		
      //  var query = "restaurant_number="+restaurant_number+"&reserve_date="+reserve_date+"&userid="+userid+"&deposit="+deposit+"&r_state="+r_state+"&teamCount="+teamCount
      	var query="restaurant_number="+restaurant_number+"&userid="+userid+"&deposit="+deposit+"&r_state="+r_state+"&teamCount="+teamCount+"&reserve_date="+reserve_date;
      
        console.log(query)	
     
     
        $.ajax({
        	 type:'GET'
        	,url:'reserveData.do'
        	,data:query
        	,success:function(arg){
        		console.log(arg)
   	
        	}
        	,error:function(arg1){
        		console.log(arg1)
        	}
        	
        })
       
}



//결제를 위한 함수
function pay(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp99349216');

	
	IMP.request_pay({
	    pg : 'danal', // version 1.1.0부터 지원. 
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : $('#people').val() * 10000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'http://www.naver.com'
	}, function(rsp) {
	    if ( rsp.success ) {
	        //결제완료
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        
	        //결제 완료 후 DB로 요청
	      
	        
	        
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});

}

//데이터 값이 있는지 없는지 체크하고 값이 다 있다면 예약 신청
function checkValue(){
	  
	 if(reserveTime ==null){
		 $('#reserveTimeCheck').modal();
		 
		 return;
	 }
	  
	  if($('#people').val()==''){
		  $('#reservePeopleCheck').modal();
		 return;
	  }
	 
	  
	 $('#reserveData').html('예약 날짜 : '+$( "#testDatepicker" ).val() + '&nbsp;'+ '예약 시간 : '+  reserveTime + '&nbsp;'+' 예약 인원 : ' + $('#people').val()) 
	 
	 
	 
	 
	 //결제 요청
	 pay(); 
} 


</script>


<input type="button" id="btn3" value="insert"> 

<!-- 예약정보 html 시작 -->
<br/><br/>
<!-- 예약할 레스토랑 소개 시작 -->
<div class="container-fluid">
<div class="row">
<div class="col-md-6">
<img src="img/portfolio/thumbnails/1.jpg" class="img-rounded" alt="1.jpg"> 
</div>
<div class="col-md-6">
<h1>Osteria Francescana</h1>
<blockquote>
  <p>레스토랑 Osteria Francescana은 미각과 시각을 동시에 충족시킬 수 있는 다양한 이탈리아 요리를 선보이는 곳입니다.</p>
  <p> 어디에서나 맛볼수 없는 이탈리아 정통 가정식을 여러분께 선보입니다. 기업행사, Party, Private Dining, Wedding, Catering 등 다양한 행사를 최상의 서비스로 즐기실 수 있습니다.
  Creative 요리의 대가인 알베르토 총괄 쉐프가 직접 기획하는 Osteria Francescana만의 창의적이고 특별한 메뉴를 경험해 보세요.</p> 
  <p> 특별한 날을 더욱 더 빛나게 하는 Special Menu, 각종 문화공연 및 브랜드와의 Collaboration Menu 등 다양한 행사 및 모임에 적합한 
  Menu를 고객님께 Customized된 서비스로 제공해 드립니다.</p>

</blockquote>
</div>
</div>
</div>
<!-- 예약할 레스토랑 소개 끝 -->
<hr>

<!-- 예약 정보 컨테이너 시작 -->
<form action="" method="GET" onsubmit="checkValue();">
<div class="container-fluid">
<div class="col-md-6"><div id="testDatepicker"></div></div>

<div class="col-md-6">
<h1>영업 및 예약시간대 </h1>
<blockquote>
  <p>Open  :  AM 11:00  /  Close  :  PM 11:00</p>
<p>Break time  :  PM 04:00  ~  05:00   /   예약 가능 인원  :  2 ~ 4 명</p>
<p>1시간 단위로 예약 받습니다.   /  정기 휴일 : 매월 22일</p>
</blockquote>
<br/>
<input type="button" id="btn1" class="btn-lg btn-info" value="시간을 입력해주세요"><br/>


<!-- 버튼 표시 시작-->
<div id="div1"  style= "display : none;">

<h3><mark>Lunch</mark></h3> 



<c:forEach var="block" begin="${restaurantDto.openingTime}" end="13" step="1">

<input type="button" class="timeBlock btn-lg" value="${block}:00" data-reserveDate="${sysdate}" date-reserveTime="${block}:00:00">


</c:forEach>


<br>--------------------------------------------------------<br>

<h3><mark>Dinner</mark></h3> 

<c:forEach var="block" begin="14" end="${restaurantDto.closingTime}" step="1">

<c:forEach var="i" items="${resultMap}">

block 값 : ${block}  linked값 ${i.value}

</c:forEach>

<input type="button" class="timeBlock btn-lg" value="${block}:00" data-reserveDate="${sysdate}" date-reserveTime="${block}:00:00">




</c:forEach>


</div>

<!-- 버튼 표시 끝-->

<select id="people" class="form-control">
<option value="">인원을 선택해주세요</option>
<option value="2">2명</option>
<option value="3">3명</option>
<option value="4">4명</option> 
<option value="5">5명</option> 
</select>

<input type="button" id="sub" class="btn-lg btn-info btn-block" value="예약 신청"><br>
<div id="reserveData"></div>
</div><!-- col-md-8 -->
</div>
</form>
<!-- 예약 정보 컨테이너 끝 -->
<hr>
<!-- 메뉴판 이미지 시작-->
<div class="container-fluid">
<div class="col-md-6">
음식 사진
</div>
<div class="col-md-6">
메뉴판 사진
</div>
</div>
<!-- 메뉴판 이미지 끝-->
<hr>
<!-- 판매자 정보 시작-->
 <div class="container-fluid">
<div id="map" class="col-md-6" style="height:400px;"></div>
<div class="col-md-6">
<h1>판매자 정보</h1>
<blockquote>
<p>상호 : Osteria Francescana</p>
<p>대표자명 : 아무개</p>
<p>소재지 : 서울특별시 영등포구 선유동 2로 57 이레빌딩</p>
<p>연락처 : 02-1544-9970</p>
</blockquote>
</div>
</div>
<!-- 판매자 정보 끝-->

<!-- 모달 메세지 시작-->
<div class="modal fade" id="reserveTimeCheck" role="dialog">
    <div class="modal-dialog" id="reserveTimeCheck"> 
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <p>시간 선택을 선택해주세요.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   
    </div>
    </div>
      
<div class="modal fade" id="reservePeopleCheck" role="dialog">
    <div class="modal-dialog"> 
      
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <p>인원 선택을 선택해주세요.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   
    </div>
    </div>    
<!-- 모달 메세지 끝 -->





<!-- 지도 표시를 위한 스크립트 -->
<script type="text/javascript">

var restaurantAddress='서울특별시 영등포구 선유동 2로 57 이레빌딩';


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667) // 지도의 중심좌표
    ,level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 


//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

geocoder.addr2coord(restaurantAddress, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        
        // 인포윈도우로 장소에 대한 설명을 표시합니다
       // var infowindow = new daum.maps.InfoWindow({
       //     content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
       // });
        //infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
})  
</script>

