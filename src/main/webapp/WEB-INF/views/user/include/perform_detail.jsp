<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, user-scalable=no"/>
<meta property="og:description" content="PIGNOSE Calendar is beautiful and eidetic jQuery date picker plugin"/>
<meta name="description" content="PIGNOSE Calendar is beautiful and eidetic jQuery date picker plugin"/>
<div id="pd">
    <div id="section01">
        <div class="pdTitle">
            <p class="pdTitleName">${showInfo[0].showDetail.showName }</p>
            <div class="pdTitleInfo">
                <span>${fn:substring(showInfo[0].tfShow.sSDate,0,10) } ~ ${fn:substring(showInfo[0].tfShow.sEDate,0,10) }</span>
                <span>|</span>
                <span>${showInfo[0].showDetail.showHallName }</span>
                <span><img src="${pageContext.request.contextPath}/images/perform_detail/map.PNG"></span>
                <div class="pdTitleLink">
	                <a onclick="clickFn()">
	                    <img src="${pageContext.request.contextPath}/images/perform_detail/link.png">
	                </a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        function clickFn(text) {
        	var t = document.createElement("textarea");
    	 	  document.body.appendChild(t);
	      	  t.value = window.location.href;
	      	  t.select();
	      	  document.execCommand('copy');
	      	  document.body.removeChild(t);
	      	alert('클립보드에 복사되었습니다.');
        }
        </script>
        <div class="pdInfoCont">
            <div class="pdInfoImg"><img src="${showInfo[0].tfShow.sPoster }" style='height: 100%; width: 100%'></div>
            <div class="pdInfoList">
                <div class="pdInfo">
                    <div>
                        <span class="pdInfoTitle">지역</span>
                        <span>${fn:split(showInfo[0].showDetail.showName,'-')[1] }</span>
                    </div>
                    <div>
                        <span class="pdInfoTitle">등급</span>
                        <span>${showInfo[0].tfShow.sAge }</span>
                    </div>
                    <div>
                        <span class="pdInfoTitle">관람일자</span>
                        <div class="pdInfoDayTime">
						<c:forEach var="item" items="${showInfo}">
	                        <span>${fn:substring(item.showDetail.showDaytime,0,16) }</span>
						</c:forEach>
                        </div>
                    </div>
                    <div>
                        <span class="pdInfoTitle">관람시간</span>
                        <span>${showInfo[0].tfShow.sRuntime }</span>
                    </div>
                    <div>
                        <span class="pdInfoTitle">출연</span>
                        <span>${showInfo[0].showDetail.showCast }</span>
                    </div>
                    <div class="pdInfoPrice">
                        <span class="pdInfoTitle price">가격</span>
                        <div class="pdInfoPriceTxt">
                            <p>${showInfo[0].tfShow.sPrice }원</p>
                        </div>
                    </div>
                    <div>
                        <span class="pdInfoTitle">공연시간 안내</span>
                        <span>${showInfo[0].tfShow.sRuntime }</span>
                    </div>
                    <div>
                        <span class="pdInfoTitle">배송 정보</span>
                        <span>우체국 택배</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="section02">
        <div class="pdBook">
            <div class="pdBookTitle">
                <p class="Txt1">날짜/시간 선택</p>
            </div>
            <div class="pdBookWrap">
                <div class="pdBookDate">
                    <div id="basic" class="article">
                        <div id="text-calendar5" class="calendar"></div>
                    </div>
                </div>
                <div class="pdBookTime">
                        <div class="box"></div>
                        <input type="hidden" value=1 id="showshowNum"/>
                </div>
            </div>
        </div>
        <div class="pdBookSeat">
            <p class="pdSeatTitle">예매가능좌석</p>
            <div class="pdSeatList">
                <p class="pdSeat">R석 ${showInfo[0].tfShow.sPrice }원<span>(잔여:석)</span></p>
            </div>
        </div>
        <div class="pdBookBtnCont">
            <span><a href="#" onclick="newWinFn()">예매하기</a></span>
        </div>
        <script type="text/javascript">
        	var showNum=1;
        	function newWinFn(showNum) {
        		showNum=$('#showshowNum').val();
        		if(showNum==1) {
        			alert('공연을 선택해주세요');
        			return false;
        		}
        		window.open('${pageContext.request.contextPath}/seat.do/'+showNum,'Ticket Finder 결제화면','width=950, height=550, resizable=no');
        	}
        </script>
    </div>
    <div id="section03">
        <div class="pdTab">
            <div class="pdTab1"><a class="on">상세정보</a></div>
			<div class="pdTab2"><a>예매/취소 안내</a></div>
			<div class="pdTab3"><a>공연장 정보</a></div>
			<c:if test="${showInfo[0].tfShow.sGenre == 'musical' || showInfo[0].tfShow.sGenre == 'play'}">
			<div class="pdTab4"><a>관람후기</a></div>
			</c:if>
        </div>
        <div class="pdDetail">
            <div class="pdDInfo on">
                <img src="${showInfo[0].showDetail.showDetail1 }">
                <img src="${showInfo[0].showDetail.showDetail2 }">
                <img src="${showInfo[0].showDetail.showDetail3 }">
                <img src="${showInfo[0].showDetail.showDetail4 }">
            </div>
            <div class="pdDCancel">
                <div class="pdDCancel1">
                    <div class="pdDCancelTitle">예매</div>
                    <div class="pdDCancelTxt">
                        <p>예매는 PC, 모바일, 고객센터 를 통해 신용카드 등으로 예매하실 수 있습니다.</p>
                        <p>(단, 상품마다 사용 가능한 결제 수단이 다르게 적용될 수 있으니 상품 상세페이지 안내 사항을 확인해주세요.)</p>
                        <p>무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다. 입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다.</p>
                        <p>(단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)</p>
                    </div>
                </div>
                <div class="pdDCancel2">
                    <div class="pdDCancelTitle">티켓수령방법</div>
                    <div class="pdDCancelTxt">
                        <p>현장수령</p>
                        <p>티켓은 예매자 본인 수령이 기본 원칙입니다.</p>
                        <p>공연 당일 예매확인서와 예매자의 신분증 을 지참하신 후 공연장 매표소에서 티켓을 수령하시면 됩니다.</p>
                        <p>배송</p>
                        <p>배송을 선택하신 경우 예매완료(결제익일) 기준 5~7일 이내에 예매 시 입력하신 주소로 배송됩니다.(영업일 기준)</p>
                        <p>일괄배송의 경우 각 상품의 지정된 배송일자 기준으로 배송이 시작됩니다. 배송 시작일은 상세정보 및 예매공지사항에서 확인할 수 있습니다.</p>
                        <p>지역 및 배송 서비스 사정에 따라 배송사가 변경될 수 있으며, 배송일이 추가적으로 소요될 수 있습니다.(우체국)</p>
                        <p>* 티켓 수령과 관련된 정책은 상품별로 상이하니 자세한 내용은 각 상품 상세정보에서 확인 부탁드립니다.</p>
                    </div>
                </div>
                <div class="pdDCancel3">
                    <div class="pdDCancelTitle">취소마감시간</div>
                    <div class="pdDCancelTxt">
                        <p>관람일 당일 예매하신 건은 취소, 변경, 환불 불가합니다.</p>
                        <p>배송이 시작된 티켓의 경우 티켓이 예스24 공연 고객센터로 취소마감시간 이전까지 반송되어야 취소 가능합니다.</p>
                        <p>(취소수수료는 도착일 기준으로 부과됩니다.)</p>
                        <p>결제수단을 복수로 선택한 경우 인터넷으로 부분취소가 불가하오니, 고객센터로 문의해주시기 바랍니다.</p>
                    </div>
                </div>
                <div class="pdDCancel4">
                    <div class="pdDCancelTitle">취소수수료</div>
                    <div class="pdDCancelTxt">
                        <p>예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.</p>
                        <p>관람일 당일 취소 가능한 상품의 경우 관람일 당일 취소 시 티켓금액의 90%가 부과됩니다.</p>
                        <p>상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인)</p>
                    </div>
                </div>
                <div class="pdDCancel5">
                    <div class="pdDCancelTitle">환불</div>
                    <div class="pdDCancelTxt">
                        <p>예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</p>
                        <p>배송 및 반송처리 된 티켓의 배송비는 환불되지 않습니다.</p>
                        
                    </div>
                </div>
            </div>
            <div class="pdDTheater">
                    <div class="theaterTitle">
                    	<img src="${pageContext.request.contextPath}/images/theater/map.PNG" style="vertical-align: -3px;">
                    	${fcltyList.fcName}
                    </div>
                    <div id="map" style="height: 400px; margin-bottom: 100px; width: 80%; border: 1px solid #ddd; margin: 0 auto; margin-bottom: 100px;"></div>
            </div>
            <div class="pdDReview">
                <div class="pdDReviewCautionCont" style="background: url(${pageContext.request.contextPath}/images/perform_detail/dotIcon.png)no-repeat left 14px;">
                    <div class="pdDReviewCaution">
                        <p class="cautionTxt1">매매, 욕설 등 티켓파인더 게시판 운영 규정에 위반되는 글은 사전 통보없이 삭제될 수 있습니다.</p>
                        <p>개인정보가 포함된 내용은 삼가 주시기 바라며, 게시물로 인해 발생하는 문제는 작성자 본인에게 책임이 있습니다.</p>
                        <a href="${pageContext.request.contextPath}/review_write/${showInfo[0].tfShow.sCode}"><img src="${pageContext.request.contextPath}/images/perform_detail/reviewBtn.png" alt=""></a>
                    </div>
                </div>
                <ul class="reviewList">
                <c:if test="${reviewList.isEmpty() }">
                <div style="text-align: center; margin: 100px 0;">해당 공연에 아직 작성된 리뷰가 없습니다.</div>
                </c:if>
                <c:forEach var="re" items="${reviewList }">
                    <li class="review">
                        <div class="reviewInfo">
                            <span class="reviewInfoTxt">${re.review.reviewUserId }</span>
                            <span class="reviewInfoTxt">${re.review.reviewDate }</span>
                            <span class="reviewInfoStar">
                            <c:forEach var="i" begin="1" end="${re.review.reviewGrade }" step="1">
                                <img src="${pageContext.request.contextPath}/images/perform_detail/infoStarOn.png">
                           	</c:forEach>
                           	<c:forEach var="i" begin="1" end="${5-re.review.reviewGrade }" step="1">
                                <img src="${pageContext.request.contextPath}/images/perform_detail/infoStarOff.png">
                           	</c:forEach>
                            </span>
                            <span class="reviewInfoTxt1">(관람일 : ${fn:substring(re.showDetail.showDaytime,0,10) })</span>
                        </div>
                        <div class="reviewTxt">${re.review.reviewContents }</div>
                    </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c3adfbd4c9359122e113ffbf3da9318"></script>
    <script type="text/javascript">
    var fcLa = '<c:out value="${fcltyList.fcLa}"/>';
	var fcLo = '<c:out value="${fcltyList.fcLo}"/>';
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = { 
	            center: new kakao.maps.LatLng(fcLa, fcLo), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	    
	    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    
	    // 마커가 표시될 위치입니다 
	    var markerPosition  = new kakao.maps.LatLng(fcLa, fcLo); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: markerPosition
	    });
	    
	    var center = new kakao.maps.LatLng(fcLa, fcLo);
	    
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	    // marker.setMap(null); 
	    
	    //setTimeout(function(){ map.relayout(); }, 1000);
	    
	    $('.pdTab a').click(function() {
	    setTimeout(function(){ 
	        map.relayout();
	        map.setCenter(center);
	    }, 0);
	    
	    $(window).trigger('resize');
	    });
    </script>
    <script type="text/javascript">
    $('.pdTab1').click(function(){
        $('.pdTab').find('a').removeClass('on');
        $('.pdTab1').children('a').addClass('on');
        $('.pdDetail').children('div.on').removeClass('on');
        $('.pdDInfo').addClass('on');
    });
    $('.pdTab2').click(function(){
        $('.pdTab').find('a').removeClass('on');
        $('.pdTab2').children('a').addClass('on');
        $('.pdDetail').children('div.on').removeClass('on');
        $('.pdDCancel').addClass('on');
    });
    $('.pdTab3').click(function(){
        $('.pdTab').find('a').removeClass('on');
        $('.pdTab3').children('a').addClass('on');
        $('.pdDetail').children('div.on').removeClass('on');
        $('.pdDTheater').addClass('on');
    });
    $('.pdTab4').click(function(){
        $('.pdTab').find('a').removeClass('on');
        $('.pdTab4').children('a').addClass('on');
        $('.pdDetail').children('div.on').removeClass('on');
        $('.pdDReview').addClass('on');
    });
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/pignose.calendar.full.js"></script>
    <script type="text/javascript">
    var cnt='${cnt}';
 	var showInfoList=new Array();
 	var showInfoTimeList=new Array();
 	var showNumList=new Array();
 	<c:forEach var="item" items="${showInfo}">
 	showInfoList.push("${fn:substring(item.showDetail.showDaytime,0,10) }");
 	showInfoTimeList.push("${fn:substring(item.showDetail.showDaytime,10,16) }");
 	showNumList.push("${item.showDetail.showNum }");
    </c:forEach>	
    $('.box').show();
    $('.box').text('${fn:substring(showInfo[0].showDetail.showDaytime,5,7) }'+"월"
    		+'${fn:substring(showInfo[0].showDetail.showDaytime,8,10) }'+"일"+'${fn:substring(showInfo[0].showDetail.showDaytime,10,16) }');
    function onSelectHandler(date, context) {
        /**
         * @date is an array which be included dates(clicked date at first index)
         * @context is an object which stored calendar interal data.
         * @context.calendar is a root element reference.
         * @context.calendar is a calendar element reference.
         * @context.storage.activeDates is all toggled data, If you use toggle type calendar.
         * @context.storage.events is all events associated to this date
         */

        var $element = context.element;
        var $calendar = context.calendar;
        var $box = $('.box').show();
        var text = '';
        $box.text(text);

        if (date[0] != null) {
            for(var i=0; i<cnt; i++) {
            	var day=showInfoList[i];
            	if(date[0].format('YYYY-MM-DD') == day) {
		            text += date[0].format('MM월DD일');
            		text+=showInfoTimeList[i];
            		$('#showshowNum').val(showNumList[i]);
            	}
            }
            	if (showInfoList.indexOf(date[0].format('YYYY-MM-DD')) == -1) {
            		text="공연이 없는 날입니다.";
            	}
        }

       
        else if (date[0] === null) {
            text += '선택한 날짜가 없습니다.';
        }

        
        $box.text(text);
    }

	//오늘 날짜 비활성화
	$('#text-calendar5').pignoseCalendar({
	lang: 'ko',
	select: onSelectHandler,
	format: 'YYYY.MM.DD',
	date: '${fn:substring(showInfo[0].showDetail.showDaytime,0,10) }',
	minDate: '${fn:substring(showInfo[0].showDetail.showDaytime,0,10) }',
	maxDate: '${fn:substring(showInfo[cnt-1].showDetail.showDaytime,0,10) }',
	disabledDates: [
		moment().format("YYYY-MM-DD") //format 속성과 상관없이 반드시 년-월-일 이어야 한다.
	]
	});
	
	$( '.pignose-calendar-top-month' ).before( $( '.pignose-calendar-top-year' ) );
    </script>
</div>