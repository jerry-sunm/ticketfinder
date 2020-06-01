<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form action="${pageContext.request.contextPath}/review_write" method="post" name="review" id="review">
<div id="rw">
    <div id="section">
        <div class="reviewTitle">
            리뷰 작성
        </div>
        <div class="reviewCont">
            <div class="reviewPlayTitle">${showOrder[0].showDetail.showName }</div>
            <div class="reviewDateCont">
                <div class="reviewDateTitle title">관람 일자</div>
                <div class="reviewDate">${fn:substring(showOrder[0].showDetail.showDaytime,0,10) }</div>
            </div>
            <div class="reviewRateCont">
                <div class="reviewRateTitle title">별점</div>
                <div class="reviewRate">
                    <span class="starR on">별1</span>
                    <span class="starR">별2</span>
                    <span class="starR">별3</span>
                    <span class="starR">별4</span>
                    <span class="starR">별5</span>
                </div>
            </div>
            <script type="text/javascript">
                $('.reviewRate span').click(function(){
                    $(this).parent().children('span').removeClass('on');
                    $(this).addClass('on').prevAll('span').addClass('on');
                    return false;
                });
            </script>
            <div class="reviewTxtCont">
                <div class="reviewTxtTitle title">관람후기</div>
                <textarea id="reviewContents" name="reviewContents"></textarea>
            </div>
            <div class="reviewCaution">
                <p class="reviewInfo">관람후기 작성 시 유의사항</p>
    
                <p class="reviewCautionTxt1">티켓파인더 게시판 운영 규정에 위반된다고 판단되는 글은 사전고지 없이 삭제될 수 있습니다.</p>
                <ul class="reviewCautionList">
                    <li>티켓 매매 및 양도, 교환의 글</li>
                    <li>전화번호, 이메일, 주소 등 회원 및 타인의 개인정보 유출이 우려되는 경우</li>
                    <li>욕설, 비방, 도배성 글을 작성한 경우</li>
                    <li>명예훼손, 저작권, 초상권의 권리 침해 및 음란한 사진을 게재한 경우</li>
                </ul>
                <p class="reviewCautionTxt1">작성된 게시물의 저작권은 작성자에게 있으며, 게시물로 인해 발생하는 문제는 작성자 본인에게 책임이 있습니다.
                <br>작성 시 유의해주시기 바랍니다.</p>
            </div>
            <div class="reviewBtn">
                <div class="btnCancel"><a href="${pageContext.request.contextPath}/perform_detail/${sCode}/${showArea}">취소</a></div>
                <div class="btnSave" onclick="goFn()">등록</div>
            </div>
            <input type="hidden" id="reviewGrade" name="reviewGrade" value="1">
            <input type="hidden" id="reviewShowCode" name="reviewShowCode" value="${sCode }">
            <input type="hidden" id="reviewUserId" name="reviewUserId" value="${id }">            
            <input type="hidden" id="reviewViewDate" name="reviewViewDate" value="${fn:substring(reviewViewDate,0,10) }">            
            <script type="text/javascript">
            function goFn() {
	            var rate= $(".starR.on").length;
           		$('#reviewGrade').val(rate);
           		var newTxt=$('#reviewContents').val();
           		console.log(newTxt);
           		$('#review').submit();
            }
            </script>
        </div>
    </div>
</div>
</form>