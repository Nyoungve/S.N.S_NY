<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- 헤더 시작 -->    
    <header>
    	
    	<!-- 헤더 첫번째 row 시작-->
        <div class="header-content row">
            
        <!-- 첫번째 row의 col-md-4 시작 -->   
            <div class="header-content-inner col-md-4" >
               <h1 id="homeHeading">S.N.S<br/><small>Stop no Show<br> 레스토랑 예약 프로그램!!</small></h1>
            </div>
            <!-- 첫번째 row의 col-md-4 끝 -->   
            <!-- 첫번째 row의 col-md-8 시작 -->   
            <div class="col-md-8">
            <br/><br/><br/><br/>
            <form class="form-inline">          
               <select class="form-control">
                <option value="">지역선택</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                </select>
                <select class="form-control">
                <option value="">인원선택</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                 <option value="5">5명</option>
                </select> 
                <select class="form-control">
                <option value="">요일선택</option>
                <option value="월">월</option>
                <option value="화">화</option>
                <option value="수">수</option>
                <option value="목">목</option>
                <option value="금">금</option>
                <option value="토">토</option>
                <option value="일">일</option>
                </select><br/><br/>
                <input type="text" class="form-control" id="type" placeholder="요리 타입을 입력해주세요.">
                <input type="text" class="form-control" id="company" placeholder="업체명을 입력해주세요.">&emsp;<a style="color:blue;font-size: 20px">search</a>
               </form>
            </div>
           <!-- 첫번째 row의 col-md-8 끝-->   
        </div>
        <!-- 헤더 첫번째 row 끝-->
        
    </header>