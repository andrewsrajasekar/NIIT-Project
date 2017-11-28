<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Online Shopping - ${title}</title>
<script>
	window.menu = '${title}';
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="less/bootshop.less">
	<script src="${js}/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet" href="${css}/bootstrap.min.css"
	media="screen" />

	
	
	
<link href="${css}/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="${css}/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${css}/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link href="${js}/google-code-prettify/prettify.css" rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="${images}/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${images}/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${images}/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${images}/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${images}/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div class="wrapper">
		<div id="header">
			<div class="container">
				<div id="welcomeLine" class="row">
					<div class="span6">
						Welcome!<strong> User</strong>
					</div>
					<div class="span6">
						<div class="pull-right">
							<a href="product_summary.html"><span class="">Fr</span></a> <a
								href="product_summary.html"><span class="">Es</span></a> <span
								class="btn btn-mini">En</span> <a href="product_summary.html"><span>&pound;</span></a>
							<span class="btn btn-mini">$155.00</span> <a
								href="product_summary.html"><span class="">$</span></a> <a
								href="product_summary.html"><span
								class="btn btn-mini btn-primary"><i
									class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your
									cart </span> </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar ================================================== -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- Page Content -->

		<div class="content">
			<!--Loading the home content-->
			<c:if test="${userClickHome == true }">
				<%@include file="home.jsp"%>
			</c:if>
			<!-- Only When User Clicks About -->
			<c:if test="${userClickAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>
			<!-- Only When User Clicks Contact -->
			<c:if test="${userClickContact == true }">
				<%@include file="contact.jsp"%>
			</c:if>
		</div>

		<!-- Footer ================================================================== -->
		<%@include file="./shared/footer.jsp"%>
		<!-- Placed at the end of the document so the pages load faster ============================================= -->
		<script src="${js}/jquery.js" type="text/javascript"></script>
		<script src="${js}/bootstrap.min.js" type="text/javascript"></script>
		<script src="${js}/google-code-prettify/prettify.js"></script>

		<script src="${js}/bootshop.js"></script>
		<script src="${js}/jquery.lightbox-0.5.js"></script>
		<!-- Self Coded JavaScript -->
		<script src="${js}/myapp.js"></script>
		<span id="themesBtn"></span>
	</div>
</body>
</html>