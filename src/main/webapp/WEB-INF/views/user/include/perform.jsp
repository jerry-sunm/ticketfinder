<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="perform">
	<div id="section01">
		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="${pageContext.request.contextPath}/perform_detail/PF160858/11">
						<img src="${pageContext.request.contextPath}/images/perform/slide1.jpg">
						<p class='slideTitle'>레이 첸 ＆ 선우예권 듀오</p>
						<p class='slideDetail'>2020. 05. 15 예술의전당 IBK 챔버홀</p>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="${pageContext.request.contextPath}/perform_detail/PF156128/11">
						<img src="${pageContext.request.contextPath}/images/perform/slide2.jpg">
						<p class='slideTitle'>오페라의 유령 월드투어</p>
						<p class='slideDetail'>2020. 06. 20 ~ 2020. 06. 27 세종문화회관 세종체임버홀</p>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="${pageContext.request.contextPath}/perform_detail/PF121682/11">
						<img src="${pageContext.request.contextPath}/images/perform/slide3.jpg">
						<p class='slideTitle' style="color: #000;">옥탑방 고양이</p>
						<p class='slideDetail' style="color: #000;">2020. 04. 23 ~ 2020. 04. 30 세종문화회관 S 씨어터</p>
					</a>
				</div>
			</div>
			<div class="swiper-button-next" style="background: url(${pageContext.request.contextPath}/images/perform/slideNext.png) no-repeat; width: 40px; height: 55px;"></div>
			<div class="swiper-button-prev" style="background: url(${pageContext.request.contextPath}/images/perform/slidePrev.png) no-repeat; width: 40px; height: 55px;"></div>
		  </div>
	</div>
	<!-- <div id="section02">
		<p class="title">Focus on</p>
		<div class="focusImg">
			<a href="perform_detail.html"><img src="img/focuson1.jpg"></a>
			<a href="perform_detail.html"><img src="img/focuson2.jpg"></a>
			<a href="perform_detail.html"><img src="img/focuson3.jpg"></a>
		</div>
	</div> -->
	<div id="section03">
		<p class="title">What's New</p>
		<div class="hotList">
		<c:forEach var="newList" items="${genreNewList }">
			<a href="${pageContext.request.contextPath}/perform_detail/${newList.tfShow.sCode }/${newList.showDetail.showArea }">
				<div class="hotWrap">
					<img src="${newList.tfShow.sPoster }">
					<div class="hotTxtWrap">
						<p class="hotTxt1">${newList.showDetail.showName }</p>
						<p class="hotTxt2">${fn:substring(newList.tfShow.sSDate,0,10) } ~ ${fn:substring(newList.tfShow.sEDate,0,10) }</p>
						<p class="hotTxt2">${newList.showDetail.showHallName }</p>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
	</div>
	<div id="section04">
		<div class="rankWrap">
			<div class="rank">
				<p class="rankTitle">
					WEEKLY RANKING
					<a href="${pageContext.request.contextPath}/rank"><img src="${pageContext.request.contextPath}/images/perform/more.png"></a>
				</p>
				<ul class="rankList">
				<c:forEach var="rank" items="${rankList }" begin="0" end="4" step="1" varStatus="status">
					<c:if test="${status.first == true}">
						<li class="on">
					</c:if>
					<c:if test="${status.first  == false}">
						<li>
					</c:if>
						<a href="${pageContext.request.contextPath}/perform_detail/${rank.tfShow.sCode }/${rank.showDetail.showArea }">
							<div class="rankDetail">
								<div class="rankNum">${status.count }위</div>
								<div class="rankImg">
									<c:if test="${status.first == true}">
										<img src="${rank.tfShow.sPoster }" class="on">
									</c:if>
									<c:if test="${status.first == false}">
										<img src="${rank.tfShow.sPoster }">
									</c:if>
								</div>
								<div class="rankTxt">
									<p class="txt1">${rank.showDetail.showName }</p>
									<p class="txt2">${fn:substring(rank.tfShow.sSDate,0,10) } ~ ${fn:substring(rank.tfShow.sEDate,0,10) }</p>
									<p class="txt3">${rank.showDetail.showHallName }</p>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
			$('ul.rankList').children('li').mouseover(function(){
				$('ul.rankList').children('li').removeClass('on');
				$(this).addClass('on');
				$(this).find('img').addClass('on');
			});
			$('ul.rankList').children('li').mouseleave(function(){
				$(this).removeClass('on');
				$(this).find('img').removeClass('on');
				$('ul.rankList').children('li:first').addClass('on');
				$('ul.rankList').children('li:first').find('img').addClass('on');
			});
			</script>
			<div class="recomCont">
				<div class="recomTitle">지역별 추천</div>
				<div class="recomList">
				<c:forEach var="area" items="${randomArea }">
					<a href="${pageContext.request.contextPath}/perform_detail/${area.tfShow.sCode }/${area.showDetail.showArea }">
						<div class="recomItem">
							<img src="${area.tfShow.sPoster }">
							<div class="recomItemTxt">
								<p class="recomItemTxt1">${area.showDetail.showName }</p>
								<p class="recomItemTxt3">${area.showDetail.showHallName }</p>
								<p class="recomItemCircle">${fn:split(area.showDetail.showName,'-')[1] }</p>
							</div>
						</div>
					</a>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div id="section05">
		<p class="listTitle"></p>
		<div class="listTab">
			<span class="listTab1"><a class="on" id="listTab01">주간랭킹순</a></span>
			<span class="listTab2"><a id="listTab02">신상품순</a></span>
			<span class="listTab3"><a id="listTab03">종료임박순</a></span>
			<span class="listTab4"><a id="listTab04">상품명순</a></span>
		</div>
		<p class="listTxt">현재 예매 가능한 공연은 <span style="color: #ec7d2c; font-weight: bold;">${cnt }</span>개입니다.</p>
		<div class="list list1 on" style="display: block;">
		<c:forEach var="rank" items="${rankList }">
			<a href="${pageContext.request.contextPath}/perform_detail/${rank.tfShow.sCode }/${rank.showDetail.showArea }">
				<div class="listItem">
					<img src="${rank.tfShow.sPoster }">
					<div class="listItemTxt">
						<p class="listItemTxt1">${rank.showDetail.showName }</p>
						<p class="listItemTxt2">${fn:substring(rank.tfShow.sSDate,0,10) } ~ ${fn:substring(rank.tfShow.sEDate,0,10) }</p>
						<p class="listItemTxt3">${rank.showDetail.showHallName }</p>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
		<div class="list list2" style="display: none;">
		<c:forEach var="rank" items="${newList }">
			<a href="${pageContext.request.contextPath}/perform_detail/${rank.tfShow.sCode }/${rank.showDetail.showArea }">
				<div class="listItem">
					<img src="${rank.tfShow.sPoster }">
					<div class="listItemTxt">
						<p class="listItemTxt1">${rank.showDetail.showName }</p>
						<p class="listItemTxt2">${fn:substring(rank.tfShow.sSDate,0,10) } ~ ${fn:substring(rank.tfShow.sEDate,0,10) }</p>
						<p class="listItemTxt3">${rank.showDetail.showHallName }</p>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
		<div class="list list3" style="display: none;">
		<c:forEach var="rank" items="${endList }">
			<a href="${pageContext.request.contextPath}/perform_detail/${rank.tfShow.sCode }/${rank.showDetail.showArea }">
				<div class="listItem">
					<img src="${rank.tfShow.sPoster }">
					<div class="listItemTxt">
						<p class="listItemTxt1">${rank.showDetail.showName }</p>
						<p class="listItemTxt2">${fn:substring(rank.tfShow.sSDate,0,10) } ~ ${fn:substring(rank.tfShow.sEDate,0,10) }</p>
						<p class="listItemTxt3">${rank.showDetail.showHallName }</p>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
		<div class="list list4" style="display: none;">
		<c:forEach var="rank" items="${abcList }">
			<a href="${pageContext.request.contextPath}/perform_detail/${rank.tfShow.sCode }/${rank.showDetail.showArea }">
				<div class="listItem">
					<img src="${rank.tfShow.sPoster }">
					<div class="listItemTxt">
						<p class="listItemTxt1">${rank.showDetail.showName }</p>
						<p class="listItemTxt2">${fn:substring(rank.tfShow.sSDate,0,10) } ~ ${fn:substring(rank.tfShow.sEDate,0,10) }</p>
						<p class="listItemTxt3">${rank.showDetail.showHallName }</p>
					</div>
				</div>
			</a>
		</c:forEach>
		</div>
	</div>
	<!-- Swiper JS -->
	<script src="${pageContext.request.contextPath}/lib/swiper.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
	  var swiper = new Swiper('.swiper-container', {
		slidesPerView: 3,
		slidesPerView: 'auto',
		slidesPerGroup: 1,
		loop: true,
		centeredSlides: true,
		loopFillGroupWithBlank: true,
		navigation: {
		  nextEl: '.swiper-button-next',
		  prevEl: '.swiper-button-prev',
		},
	  });
	</script>
	<script type="text/javascript">
		   /* function showListFn(sGenre, tab) {
			   $(".list").children().remove();
			   console.log("장르="+sGenre);
			   console.log("탭이름="+tab);
			   $.ajax({
				   type: "GET",
					url: "showlist?sGenre="+sGenre+"&tab="+tab,
					//data: { "sGenre":sGenre, "tab":tab },
					dataType: "json",
					success: function(json) {
						console.log(json.length);
						console.log(json[0].tfShow);
						for(var i=0; i<json.length; i++) {
							var html="";
							html+="<a href='${pageContext.request.contextPath}/perform_detail/"+json[i].tfShow.sCode+"/"+json[i].showDetail.showArea+"'>";
							html+="<div class='listItem'>";
							html+="<img src='"+json[i].tfShow.sPoster+"'>";
							html+="<div class='listItemTxt'>";
							html+="<p class='listItemTxt1'>"+json[i].showDetail.showName+"</p>";
							html+="<p class='listItemTxt2'>"+json[i].tfShow.sSDate+"~"+json.showArea[i].tfShow.sEDate+"</p>";
							html+="<p class='listItemTxt3'>"+json[i].showDetail.showHallName+"</p>";
							html+="</div>";
							html+="</div>";
							html+="</a>";
							
							$(".list").append(html);
						}
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status)
					} 
			   });
		   } */
	   
		   /* var tab="listTab01";
		   var sGenre="${sGenre }";
		   console.log('함수시작전');
		   showListFn(sGenre,tab); */
		
		   $('.listTab1').click(function(){
			   $('.listTab').find('a').removeClass('on');
			   $('#section05').children('.list').removeClass('on');
			   $('#section05').children('.list').not('.on').css("display","none");
			   $('.listTab1').children('a').addClass('on');
			   $('#section05').children('.list1').addClass('on');
			   $('#section05').children('.list1').css("display","block");
			   //tab=$('.listTab1').children('a').attr('id');
			   //showListFn(sGenre,tab);
		   });
		   $('.listTab2').click(function(){
			   $('.listTab').find('a').removeClass('on');
			   $('#section05').children('.list').removeClass('on');
			   $('#section05').children('.list').not('.on').css("display","none");
			   $('.listTab2').children('a').addClass('on');
			   $('#section05').children('.list2').addClass('on');	
			   $('#section05').children('.list2').css("display","block");
		   });
		   $('.listTab3').click(function(){
			   $('.listTab').find('a').removeClass('on');
			   $('#section05').children('.list').removeClass('on');
			   $('#section05').children('.list').not('.on').css("display","none");
			   $('.listTab3').children('a').addClass('on');
			   $('#section05').children('.list3').addClass('on');
			   $('#section05').children('.list3').css("display","block");
		   });
		   $('.listTab4').click(function(){
			   $('.listTab').find('a').removeClass('on');
			   $('#section05').children('.list').removeClass('on');
			   $('#section05').children('.list').not('.on').css("display","none");
			   $('.listTab4').children('a').addClass('on');
			   $('#section05').children('.list4').addClass('on');	
			   $('#section05').children('.list4').css("display","block");
		   });
	   </script>
</div>