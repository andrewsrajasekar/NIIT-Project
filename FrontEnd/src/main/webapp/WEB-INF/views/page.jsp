<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="superhero" value="/resources/superhero" />
<spring:url var="united" value="/resources/united" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Online Shopping - ${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
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





<!-- Bootstrap style responsive -->
<link href="${css}/bootstrap-responsive.min.css" rel="stylesheet" />


<link href="${css}/dataTables.bootstrap.css" rel="stylesheet" />
<link href="${css}/base.css" rel="stylesheet" media="screen" />
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

					<div class="span6 ">
						<div style="position: relative; left: 35px; top: 10px;">
							Welcome!</div>
						<strong> <security:authorize access="isAuthenticated()">
								<li class="dropdown"><a href="javascript:void(0)"
									class="btn btn-default dropdown-toggle" id="dropdownMenu1"
									data-toggle="dropdown">${userModel.fullName}<span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
									<security:authorize access="hasAuthority('USER')">
										<li><a href="${contextRoot}/cart"> <span
												class="glyphicon glyphicon-shopping-cart"></span> <span
												class="badge">${userModel.cart.cartLines}</span> - &#8377;
												${userModel.cart.grandTotal}
										</a></li>
										<li class="divider" role="separator"></li>
										</security:authorize>
										<li><a href="${contextRoot}/perform-logout">Logout</a></li>
									</ul></li>
							</security:authorize>

						</strong>
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
				<!-- Only When User Clicks View Products -->
				<c:if
					test="${userClickAllProducts == true or userClickCategoryProducts == true }">
					<%@include file="listProducts.jsp"%>
				</c:if>
				<!-- Only When User Clicks Show Product -->
				<c:if test="${userClickShowProduct == true}">
					<%@include file="singleProduct.jsp"%>
				</c:if>
				<!-- Only When User Clicks Manage Products -->
				<c:if test="${userClickManageProducts == true}">
					<%@include file="manageProducts.jsp"%>
				</c:if>
			</div>

			<!-- Footer ================================================================== -->



			<%@include file="./shared/footer.jsp"%>

			<!-- Placed at the end of the document so the pages load faster ============================================= -->
			<script src="${js}/jquery.js" type="text/javascript"></script>
			<!-- Jquery Validator -->
			<script src="${js}/jquery.validate.js" type="text/javascript"></script>
			<script src="${js}/bootstrap.min.js" type="text/javascript"></script>
			<!-- DataTable Plugin -->
			<script src="${js}/jquery.dataTables.js" type="text/javascript"></script>


			<!-- DataTable Bootstrap Script -->

			<script src="${js}/dataTables.bootstrap.js" type="text/javascript"></script>
			<!-- Bootbox -->
			<script src="${js}/bootbox.min.js" type="text/javascript"></script>


			<script src="${js}/google-code-prettify/prettify.js"></script>

			<script src="${js}/bootshop.js"></script>
			<script src="${js}/jquery.lightbox-0.5.js"></script>
			<!-- Self Coded JavaScript -->
			<script src="${js}/myapp.js"></script>
			<span id="themesBtn"></span>
		</div>
	</div>
</body>
</html>