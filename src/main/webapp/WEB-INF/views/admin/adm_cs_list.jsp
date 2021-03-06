<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TicketFinder - FAQ</title>


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


    <!--Switchery [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/switchery/switchery.min.css" rel="stylesheet">


    <!--Bootstrap Select [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="${pageContext.request.contextPath }/a_css/nifty-demo.min.css" rel="stylesheet">




    <!--SCRIPT-->
    <!--=================================================-->

    <!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
</head>
<body>
	<div id="container" class="effect mainnav-lg">
		
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
					<h1 class="page-header text-overflow">FAQ</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->
				
				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/faqlist.admin">문의 관리</a></li>
					<li class="active">FAQ</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->
				
				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel">
								<div class="panel-body">
									<button class="btn btn-pink" id="insertfaq">FAQ 등록</button>
								
					
									<!-- GENERAL -->
									<!--===================================================-->
									<h3 class="pad-all bord-btm text-thin">자주 묻는 질문</h3>
									<div id="demo-gen-faq" class="panel-group accordion">
										<c:forEach var="faqCount" items="${faqCountList }">
										<c:set var="i" value="${i+1 }" />
										<div class="bord-no pad-top">
												<!-- Question -->
												<div class="text-semibold pad-hor text-lg">
													<a href="#demo-gen-faq${i }" data-toggle="collapse" data-parent="#demo-gen-faq">${faqCount.faqTitle }</a>
												</div>
						
												<!-- Answer -->
												<div id="demo-gen-faq${i }" class="collapse">
													<div class="pad-all">
															${faqCount.faqContents }
													</div>
												</div>
										</div>
										</c:forEach>
									</div>
									<!--===================================================-->
					
									<hr class="bord-no pad-all">
									
									<!-- PAYMENT -->
									<!--===================================================-->
									<h3 class="pad-all bord-btm text-thin">예매 관련 문의</h3>
									<div id="demo-pym-faq" class="panel-group accordion">
										<c:forEach var="faqOne" items="${faqCategoryOne }">
										<c:set var="i" value="${i+1 }" />
										<div class="bord-no pad-top">
											<!-- Question -->
											<div class="text-semibold pad-hor text-lg">
												<a href="#demo-pym-faq${i }" data-toggle="collapse" data-parent="#demo-pym-faq">${faqOne.faqTitle }</a>
											</div>
					
					
											<!-- Answer -->
											<div id="demo-pym-faq${i }" class="collapse">
												<div class="pad-all">
													${faqOne.faqContents }
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									<!--===================================================-->
									
									<hr class="bord-no pad-all">
					
									<!-- ACCOUNT -->
									<!--===================================================-->
									<h3 class="pad-all bord-btm text-thin">계정 관련 문의</h3>
									<div id="demo-acc-faq" class="panel-group accordion">
										<c:forEach var="faqTwo" items="${faqCategoryTwo }">
										<c:set var="i" value="${i+1 }" />
										<div class="panel panel-trans pad-top">
											<!-- Question -->
											<div class="text-semibold pad-hor text-lg">
												<a href="#demo-acc-faq${i }" data-toggle="collapse" data-parent="#demo-acc-faq">${faqTwo.faqTitle }</a>
											</div>
					
											<!-- Answer -->
											<div id="demo-acc-faq${i }" class="collapse">
												<div class="pad-all">
													${faqTwo.faqContents }
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									<!--===================================================-->
									
									<hr class="bord-no pad-all">
									
									<!-- ACCOUNT -->
									<!--===================================================-->
									<h3 class="pad-all bord-btm text-thin">취소/환불 관련 문의</h3>
									<div id="demo-ref-faq" class="panel-group accordion">
										<c:forEach var="faqThree" items="${faqCategoryThree }">
										<c:set var="i" value="${i+1 }" />
										<div class="panel panel-trans pad-top">
											<!-- Question -->
											<div class="text-semibold pad-hor text-lg">
												<a href="#demo-ref-faq${i }" data-toggle="collapse" data-parent="#demo-ref-faq">${faqThree.faqTitle }</a>
											</div>
					
											<!-- Answer -->
											<div id="demo-ref-faq${i }" class="collapse">
												<div class="pad-all">
													${faqThree.faqContents }
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									<!--===================================================-->
					
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
				<!--===================================================-->
				<!--End page content-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->


			
			<!--MAIN NAVIGATION-->
			<!--===================================================-->
			<%@include file="adm_nav.jsp" %>
			<!--===================================================-->
			<!--END MAIN NAVIGATION-->
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
            <div class="hide-fixed pull-right pad-rgt">Currently v2.2.2</div>



            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <!-- Remove the class name "show-fixed" and "hide-fixed" to make the content always appears. -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

            <p class="pad-lft">&#0169; 2015 Your Company</p>



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
	<!--===================================================-->
	<!-- END SETTINGS -->

	
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


	<!--Switchery [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/switchery/switchery.min.js"></script>


	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.js"></script>


	<!--Demo script [ DEMONSTRATION ]-->
	<script src="${pageContext.request.contextPath }/a_js/nifty-demo.min.js"></script>
	
	<script type="text/javascript">
	$(window).on('load', function() {
		$('#mainnav-menu').children().eq(7).addClass('active-sub').children().eq(1).addClass('in').children().eq(2).addClass('active-link');
		
		$('#insertfaq').click(function() {
			location.href="${pageContext.request.contextPath }/faqadd.admin";
		});
	});
	</script>
</body>
</html>

