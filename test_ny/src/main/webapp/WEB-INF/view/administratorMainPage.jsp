<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  
  $(function(){
		
	  
	  //업체관리 버튼이 눌렸을 때
	  $('#customerBtn').on('click',function(){
		$('.menu').css("background-color", "");
		$(this).css("background-color", "blue");
		
		//후기 게시판 고객 검색창이 사라지게 한다.
		$('#div2').css("display","none");
		
		//검색되었던 테이블이 사라지게 한다.
		$('table').remove();
		
		//업체 검색창이 나타나게 한다.
		$("#div1").css("display","");
		
		//업체 검색용 action 지정
		$('#formId').prop("action","owner.do");
		
	  })
	  
	  //블랙리스트 버튼이 눌렸을 때
	  $('#blacklistBtn').on('click',function(){
		$('.menu').css("background-color", "");
		$(this).css("background-color", "blue");
		
		//후기게시판 고객 검색창이 사라지게 한다.
		$('#div2').css("display","none");
		
		//검색되었던 테이블이 사라지게 한다.
		$('table').remove();
		
		//후기 검색창이 나타나게 한다.
		$("#div1").css("display","");
		
		//후기 검색용 action을 지정한다.
		$('#formId').prop("action","blackList.do");
		
		
	  })
	  
	  
	  
	  //후기 게시판 버튼이 눌렸을 때
	  $('#reviewBtn').on('click',function(){
		$('.menu').css("background-color", "");
		$(this).css("background-color", "blue");
		
		//블랙리스트,업체관리 업체 검색창을 사라지게 한다.
		$("#div1").css("display","none");
		
		//검색되었던 테이블이 사라지게 한다.
		$('table').remove();
		
		//후기 검색창이 나타나게 한다.
		$('#div2').css("display","");
		
	  })
	  
	  //고객관리에서 고객정보를 불러오면 모달창을 띄워줌
	  if(${customerDTO !=null}){
		  $('#myModal').modal({backdrop: "static"});
		  
	  }
	
	  if(${insertOk !=null}){
		  $('#insertOkModal').modal();
		  
	  }
	  
	  
  }) // document.ready 끝
  
 
  
  
  </script>
  
</head>
<body>

<!-- 기본 입력폼 시작 화면구성 1/1/10-->
<div class="container-fluid">
 
  <div class="col-md-2 btn-group-vertical">
    <button type="button" id="customerBtn" class="btn btn-info menu">고객 관리</button>
    <button type="button" id="blacklistBtn" class="btn btn-info menu">블랙 리스트</button>
    <button type="button" id="reviewBtn" class="btn btn-info menu">후기 관리</button>
  </div>

<div class="col-md-1"></div>

<!-- 액션을 지정하지 않은 고객 관리, 블랙리스트용 form을 숨겨놓는다. -->
<div id="div1" class="col-md-9" style= "display : none;">
<form class="form-inline" id="formId">
<input type="text" class="form-control" name="id" placeholder="고객 ID">
<button type="submit" class="btn">Search</button>
</form>
</div >


<!-- 후기 관리용 form -->
<div id="div2" class="col-md-10" style= "display : none;">
<form class="form-inline" action="customerList.do">
<input type="text" class="form-control" name="id" placeholder="고객 ID">
<input type="text" class="form-control" name="company" placeholder="업체명">
<button type="submit" class="btn">Search</button>
</form>
</div >
</div>
<!-- 기본 입력폼 끝-->



<!-- 결과 표시창 시작-->
<!-- 블랙리스트 회원 보여주는 테이블 시작-->
<div class="container-fluid">
<div class="col-md-2"></div>
<div class="col-md-5">

      <c:forEach var="blckCustomer" items="${blackList}">
      <table class="table table-bordered">
    <thead>
      <tr>
        <th>고객 ID</th>
        <th>NoShow</th>
        <th>Email</th>
        <th>등급전환</th>
      </tr>
    </thead>
    <tbody>
       <tr>
        <td>${blckCustomer.userid}</td>
        <td>${blckCustomer.noShowCount}</td>
        <td>${blckCustomer.email}</td>
        <form action="noShowCount.do">
        <input type="hidden" name="id" value="${blckCustomer.userid}">
        <td><button type="submit" class="btn">OK</button></td>
        </form>
      </tr>
       </tbody>
  	</table>
      </c:forEach>
      
</div>
<div class="col-md-5"></div>
</div>
<!-- 블랙리스트 회원 보여주는 테이블 끝 -->


<!-- 등록업체 보여주는 모달 시작-->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <table class="table table-bordered">
          <thead>
     		 <tr>
        	<th>고객 ID</th>
        	<th>Email</th>
       	 	<th>고객 성명</th>
    	  </tr>
   		 </thead>
          <tbody>
       <tr>
        <td>${customerDTO.userid}</td>
        <td>${customerDTO.email}</td>
        <td>${customerDTO.name}</td>
      </tr>
       </tbody>
          </table>
          
          
        </div>
        <div class="modal-body">
          <p>해당 고객 ID를 업체 ID로 등록 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
           <form action="insertShop.do">
           <input type="hidden" name="userid" value="${customerDTO.userid}">
           <input type="hidden" name="password" value="${customerDTO.password}">
           <input type="hidden" name="mobile" value="${customerDTO.mobile}">
           <input type="hidden" name="email" value="${customerDTO.email}">
            <div class="form-group">
    		<label for="restaurant_number">사업자 등록번호:</label>
    		<input type="text" class="form-control" id="restaurant_number" name="restaurant_number" placeholder="사업자 등록번호를 입력해주세요.">
  			</div>
          <input type="submit" class="btn btn-default">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </form>
          
        </div>
      </div>
      
    </div>
 </div>
 
<!-- 등록업체 보여주는 모달 시작-->


<!-- 정상적인 사업주 등록 시 모달 시작 -->
<div id="insertOkModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <p>사업주등록이 정상처리되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- 정상적인 사업주 등록 시 모달 끝 -->


<!-- 결과 표시창 끝-->

	  

</body>
</html>