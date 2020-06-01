<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TicketFinder - FAQ 등록</title>


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
    
    <!--Summernote [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/summernote/summernote.min.css" rel="stylesheet">


	<!--SCRIPT-->
	<!--=================================================-->

	<!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
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
					<h1 class="page-header text-overflow">FAQ 등록</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/faqlist.admin">문의 관리</a></li>
					<li class="active">FAQ 등록</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->


		

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">FAQ 등록</h3>
							</div>
						
							<!-- Foo Table - Add & Remove Rows -->
							<!--===================================================-->
							<div class="panel-body">
								<!--Input form-->
								<form role="form" class="form-horizontal" action="${pageContext.request.contextPath }/faqadd.admin" method="post">
									<input type="hidden" name="faqContents" value="">
									<div class="form-group">
										<label class="col-lg-1 control-label text-left" for="selectCategory">FAQ종류</label>
										<div class="col-lg-3">
											<select id="selectCategory" name="faqCategory">
												<option value="티켓예매">티켓예매</option>
												<option value="회원">회원</option>
												<option value="취소/환불">취소/환불</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-1 control-label text-left" for="inputSubject">FAQ제목</label>
										<div class="col-lg-11">
											<input type="text" id="inputSubject" class="form-control" name="faqTitle">
										</div>
									</div>
									<!--Attact file button-->
									<!-- <div class="media pad-btm">
										<div class="media-left">
											<span class="btn btn-default btn-file">
												첨부파일 <input type="file">
											</span>
										</div>
										<div id="attach-file" class="media-body"></div>
									</div> -->
				
				
									<!--Wysiwyg editor : Summernote placeholder-->
									<div id="mail-compose"></div>
				
									<div class="pad-ver">
				
										<!--Send button-->
										<button id="mail-send-btn" type="button" class="btn btn-success btn-labeled">
											<span class="btn-label"><i class="fa fa-paper-plane"></i></span> FAQ 등록
										</button>
									</div>
								</form>
							</div>
							<!--===================================================-->
							<!-- End Foo Table - Add & Remove Rows -->
						
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
	
	<!--Summernote [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/summernote/summernote.min.js"></script>
	
	<script type="text/javascript">
	$(window).on('load', function() {
		$('#mainnav-menu').children().eq(7).addClass('active-sub').children().eq(1).addClass('in').children().eq(2).addClass('active-link');
		
		// MAILBOX-COMPOSE.HTML
		// =================================================================
		if ($('#mail-compose').length) {
			// SUMMERNOTE
			// =================================================================
			// Require Summernote
			// http://hackerwins.github.io/summernote/
			// =================================================================
			$('#mail-compose').summernote({
				height:500
			});

			// Attachment button.
			// =================================================================
			/* $('.btn-file :file').on('fileselect', function(event, numFiles, label, fileSize) {
				$('#attach-file').html('<strong class="box-block text-capitalize"><i class="fa fa-paperclip fa-fw"></i> '+label+'</strong><small class="text-muted">'+fileSize+'</small>');
			}); */
			return;
		}
		
	});
	
	$('#mail-send-btn').click(function() {
		$("input[name='faqContents']").attr('value', $('.note-editable p').text());
		/* if($("input[name='questionFile']").value=="") {
			
		} */
		//form.submit();
		$('.form-horizontal').submit();
	});
	</script>
</body>
</html>