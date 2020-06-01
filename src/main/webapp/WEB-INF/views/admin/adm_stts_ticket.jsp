<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TicketFinder - Admin</title>


	<!--STYLESHEET-->
	<!--=================================================-->

	<!--Open Sans Font [ OPTIONAL ] -->
 	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">


	<!--Bootstrap Stylesheet [ REQUIRED ]-->
	<link href="${pageContext.request.contextPath }/a_css/bootstrap.min.css" rel="stylesheet">


	<!--Nifty Stylesheet [ REQUIRED ]-->
	<link href="${pageContext.request.contextPath }/a_css/nifty.min.css" rel="stylesheet">


	<!--Font Awesome [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!--FooTable [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/fooTable/css/footable.core.css" rel="stylesheet">	

	<!--Bootstrap Select [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
    
    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
    
	<!--SCRIPT-->
	<!--=================================================-->

	<!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
    
    <style type="text/css">
    	.tab-base .nav-tabs>li:not(.active)>a{background-color:rgba(189,189,189,0.35);opacity:.7;-webkit-transition:opacity,0.3s;transition:opacity,0.3s}
    	.nav-tabs.sec>li.active>a{background-color:rgba(249, 162, 153, 0.35);}
    	.tab-base .tab-content{box-shadow:0 0 0 rgba(0,0,0,0.05); }
    </style>
</head>
<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
		
		<!--NAVBAR-->
		<!--===================================================-->
		<%@include file="adm_header.jsp" %>
		<!--===================================================-->
		<!--END NAVBAR-->

		<div class="boxed">

			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				
				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
					<h1 class="page-header text-overflow">티켓 발권현황</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/sttsshow.admin">통계 및 매출</a></li>
					<li class="active">티켓 발권현황</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->


		

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">티켓 발권 현황</h3>
							</div>
						
							<!-- Foo Table - Filtering -->
							<!--===================================================-->
							<div class="panel-body">
								<table id="foo-filtering" class="table table-bordered table-hover toggle-circle" data-page-size="7">
									<thead>
										<tr>
											<th>공연명</th>
											<th>관람일</th>
											<th>좌석등급</th>
											<th>단가</th>
											<th>발권매수</th>
											<th>총 금액</th>
										</tr>
									</thead>
									<div class="pad-btm form-inline">
										<div class="row">
											<div class="col-sm-8 text-xs-center">
												<div class="form-group" style="display: block;">
													<label class="control-label">공연명</label>
													<!-- Bootstrap Select with Search Input -->
													<!--===================================================-->
													<select id="foo-filter-status" class="form-control selectpicker" data-live-search="true" data-width="25%">
														<option></option>
														<c:forEach var="tfShow" items="${tfShowList }">
														<option>${tfShow.sName }</option>
														</c:forEach>
													</select>
													<!--===================================================-->
													
													<!--Bootstrap Datepicker : Range-->
													<!--===================================================-->
													<div id="dp-range" style="display: inline-block;">
														<div class="input-daterange input-group" id="datepicker">
															<input type="text" class="form-control" name="startDate" autocomplete="off" id="startDate"/>
															<span class="input-group-addon">to</span>
															<input type="text" class="form-control" name="endDate" autocomplete="off" id="endDate"/>
														</div>
													</div>
													<button class="panel-ref-btn btn btn-default" data-target="#page-content" data-toggle="panel-overlay">
														<i class="fa fa-rotate-right fa-fw"></i> Refresh
													</button>
													<!--===================================================-->
												</div>
											</div>
											<div class="col-sm-4 text-xs-center text-right">
												<div class="form-group">
													<input id="foo-search" type="text" placeholder="Search" class="form-control" autocomplete="off">
												</div>
											</div>
										</div>
									</div>
									<tbody>
									<c:choose>
										<c:when test="${!empty(ticketing) }">
											<c:forEach var="ticket" items="${ticketing }">
											<tr>
												<td>${ticket.tfShow.sName }</td>
												<td>${fn:substring(ticket.tfOrder.orderDate,0,10) }</td>
												<td><span class="label label-table label-success">${ticket.tfOrder.orderGrade }</span></td>
												<td>
													<fmt:formatNumber value="${ticket.tfOrder.orderPrice/ticket.tfOrder.orderQty }" type="number" maxFractionDigits="3"/>원
												</td>
												<td>${ticket.tfOrder.orderQty }</td>
												<td>
													<fmt:formatNumber value="${ticket.tfOrder.orderPrice }" type="number" maxFractionDigits="3"/>원
												</td>
											</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<tr>
											<td colspan="6">조회 결과가 없습니다.</td>
										</tr>
										</c:otherwise>
									</c:choose>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6">
												<div class="text-right">
													<ul class="pagination"></ul>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
							<!--===================================================-->
							<!-- End Foo Table - Filtering -->
						
						</div>
					</div>
				</div>
				
				
			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->


			
			<!--MAIN NAVIGATION-->
			<!--===================================================-->
			<%@include file="adm_nav.jsp" %>
			<!--===================================================-->
			<!--END MAIN NAVIGATION-->
			
			<!--ASIDE 삭제함-->
			<!--===================================================-->
			<!--===================================================-->
			<!--END ASIDE-->

		</div>

		

        <!-- FOOTER -->
        <!--===================================================-->
        <footer id="footer">

            <!-- Visible when footer positions are fixed -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div class="show-fixed pull-right">
                <ul class="footer-list list-inline">
                    <li>
                        <p class="text-sm">SEO Proggres</p>
                        <div class="progress progress-sm progress-light-base">
                            <div style="width: 80%" class="progress-bar progress-bar-danger"></div>
                        </div>
                    </li>

                    <li>
                        <p class="text-sm">Online Tutorial</p>
                        <div class="progress progress-sm progress-light-base">
                            <div style="width: 80%" class="progress-bar progress-bar-primary"></div>
                        </div>
                    </li>
                    <li>
                        <button class="btn btn-sm btn-dark btn-active-success">Checkout</button>
                    </li>
                </ul>
            </div>



            <!-- Visible when footer positions are static -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div class="hide-fixed pull-right pad-rgt">Currently v1.0.0</div>



            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <!-- Remove the class name "show-fixed" and "hide-fixed" to make the content always appears. -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

            <p class="pad-lft">&#0169; 2020 TicketFinder</p>



        </footer>
        <!--===================================================-->
        <!-- END FOOTER -->


        <!-- SCROLL TOP BUTTON -->
        <!--===================================================-->
        <button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
        <!--===================================================-->



	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->


	
	
	<!--JAVASCRIPT-->
	<!--=================================================-->
	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/a_js/jquery-2.1.1.min.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/a_js/bootstrap.min.js"></script>

	<!--Fast Click [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/fast-click/fastclick.min.js"></script>
	
	<!--Nifty Admin [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/a_js/nifty.min.js"></script>
	
	<!--FooTable [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/fooTable/dist/footable.all.min.js"></script>
	
	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.js"></script>
	
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript">
	$(window).on('load', function() {
		$('#mainnav-menu').children().eq(5).addClass('active-sub').children().eq(1).addClass('in').children().eq(2).addClass('active-link');
		
		var filtering = $('#foo-filtering');
		filtering.footable().on('footable_filtering', function (e) {
			var selected = $('#foo-filter-status').find(':selected').val();
			e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
			e.clear = !e.filter;
		});

		// Filter status
		$('#foo-filter-status').change(function (e) {
			e.preventDefault();
			filtering.trigger('footable_filter', {filter: $(this).val()});
		});

		// Search input
		$('#foo-search').on('input', function (e) {
			e.preventDefault();
			filtering.trigger('footable_filter', {filter: $(this).val()});
			console.log(1);
		});
		
		$('#dp-range .input-daterange').datepicker({
			format: "yyyy-mm-dd",
			todayBtn: "linked",
			autoclose: true,
			todayHighlight: true
		});
		
		$('.panel-ref-btn').niftyOverlay().on('click', function(){
			var $el = $(this), relTime;
			$el.niftyOverlay('show');

			// Do something...
			location.href="${pageContext.request.contextPath }/sttsticket.admin";
			//location.reload();


			relTime = setInterval(function(){
				// Hide the screen overlay
				$el.niftyOverlay('hide');

				clearInterval(relTime);
			},2000);
		});
	});
	
	$('#startDate').change(function(){
		var sd=$('#startDate').val();
		var ed=$('#endDate').val();
		if(sd.length==10 && ed.length==10) {
			if(dateCal(sd).getTime() <= dateCal(ed).getTime()) {
				dateSelect(sd,ed);
			}
		}
	});
	
	$('#endDate').change(function(){
		var sd=$('#startDate').val();
		var ed=$('#endDate').val();
		if(sd.length==10 && ed.length==10) {
			if(dateCal(sd).getTime() <= dateCal(ed).getTime()) {
				dateSelect(sd,ed);
			}
		}
	});
	
	function dateCal(inputVal) {
		var year = inputVal.substring(0,4);
		var month = inputVal.substring(5,7);
		var day = inputVal.substring(8,10);
		var date = new Date();
		date.setFullYear(year, month-1, day); // 실제 사용하는 월에서 1을 빼고 셋팅을 해줘야 한다. Date 객체에서는 월의 값으로 0부터 11을 사용한다.
		return date;
	}
	
	function dateSelect(startDate, endDate) {
		$.ajax({
			type: "get",
			url: "ticketdate.admin?startDate="+startDate+"&endDate="+endDate,
			dataType: "json",
			success: function(json) {
				$("#foo-filtering tbody tr").remove();
				if(json.length==0){
					var html='<tr style="display: table-row;" class="footable-even"><td colspan="6">조회 결과가 없습니다.</td></tr>';
					$('#foo-filtering tbody').append(html);
				} else {
					var i=1;
					$(json).each(function(){
						var htmlO='';
						if(i%2==1) htmlO+='<tr class="footable-even" style="display: table-row;">';
						if(i%2==0) htmlO+='<tr class="footable-odd" style="display: table-row;">';
						htmlO+='<td>'+this.tfShow.sName+'</td>';
						htmlO+='<td>'+this.tfOrder.orderDate.substring(0,10)+'</td>';
						htmlO+='<td><span class="label label-table label-success">'+this.tfOrder.orderGrade+'</span></td>'; 
						htmlO+='<td>'+(this.tfOrder.orderPrice/this.tfOrder.orderQty).toLocaleString()+'</td>';
						htmlO+='<td>'+this.tfOrder.orderQty+'</td>';
						htmlO+='<td>'+this.tfOrder.orderPrice.toLocaleString()+'</td>';
						htmlO+='</tr>';
						
						$('#foo-filtering tbody').append(htmlO);
						i++;
					});
				}
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	}
	</script>
</body>
</html>