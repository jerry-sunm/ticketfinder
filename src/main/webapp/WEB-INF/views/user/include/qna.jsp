<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="cs">
    <div id="section01">
        <p class="csTitle">고객 센터</p>
    </div>
    <div id="section02">
        <div class="csTab">
            <div class="csTab1"><a href="${pageContext.request.contextPath}/cs">공지사항</a></div>
            <div class="csTab2"><a>이용안내</a></div>
            <div class="csTab3"><a href="${pageContext.request.contextPath}/faq">FAQ</a></div>
            <div class="csTab4"><a class="on">1:1 문의</a></div>
        </div>
    </div>
    <div id="section03">
        <div class="how">
            <div class="howTab">
                <div class="how1 on">예매방법</div>|
                <div class="how2">취소/환불</div>|
                <div class="how3">발권/배송</div>
            </div>
            <div class="howCont">
                <div class="how1Img on"><img src="${pageContext.request.contextPath}/images/cs/how1.png"></div>
                <div class="how2Img"><img src="${pageContext.request.contextPath}/images/cs/how2.png"></div>
                <div class="how3Img"><img src="${pageContext.request.contextPath}/images/cs/how3.PNG"></div>
            </div>
        </div>
        <div class="qna on">
            <div class="qnaCont">
                <div class="qnaBtn">
                    <a href="${pageContext.request.contextPath}/qna_write"><div class="qnaWriteBtn">1:1문의 등록하기</div></a>
                </div>
                <div class="qnaListPart">
                    <span>NO</span>
                    <span>처리상태</span>
                    <span>제목</span>
                    <span>등록일</span>
                </div>
                <c:if test="${qnaList.isEmpty() }">
	                <div class="qnaNone">
	                    등록한 문의가 없습니다. 버튼을 눌러 문의해주세요.
	                </div>
                </c:if>
                <c:if test="${!qnaList.isEmpty() }">
	                <c:forEach var="qna" items="${qnaList }" varStatus="status">
		                <a>
		                    <div class="qnaList">
		                        <div class="qnaListItem">
		                            <div class="qnaNo">${status.count }</div>
		                            <div class="qnaGroup">${qna.questionState }</div>
		                            <div class="qnaTitle">${qna.questionTitle }</div>
		                            <div class="qnaDate">${fn:substring(qna.questionDate,0,10) }</div>
		                        </div>
		                        <div class="qnaAnswer">
		                        <c:if test="${qna.questionContentsRe == null }">
		                        	<div>내 문의 내용 : ${qna.questionContents }</div>
		                        	<div>아직 답변이 등록되지 않았습니다.</div>
		                        </c:if>
		                        <c:if test="${qna.questionContentsRe != null }">
		                        	<div>내 문의 내용 : ${qna.questionContents }</div>
		                            <div>답변 : ${qna.questionContentsRe }</div>
		                        </c:if>
		                        </div>
		                    </div>
		                </a>
	                </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $('.csTab2').click(function(){
    	$('.csTab').find('a').removeClass('on');
		$(this).children('a').addClass('on');
        $('#section03').children('div.on').removeClass( 'on' );
        $('.how').addClass('on');
    });
    $('.csTab4').click(function(){
    	$('.csTab').find('a').removeClass('on');
		$(this).children('a').addClass('on');
        $('#section03').children('div.on').removeClass( 'on' );
        $('.qna').addClass('on');
    });
    $('.how1').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how1').addClass('on');
        $('.how1Img').addClass('on');
    });
    $('.how2').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how2').addClass('on');
        $('.how2Img').addClass('on');
    });
    $('.how3').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how3').addClass('on');
        $('.how3Img').addClass('on');
    });
    $('.qnaList').click(function(){
	    $(this).toggleClass('on');
	    $(this).children('.qnaAnswer').toggleClass('on');
	    $(this).children('.qnaListItem').toggleClass('on');
    });
    </script>
</div>