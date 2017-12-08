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
					<div class="span6">
						Welcome!<strong> User</strong>
					</div>

				</div>
			</div>
		</div>


		<!-- Navbar ================================================== -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</div>
		</nav>
		<!-- Page Content -->

		<div class="content">
			<div class="container">
<%--This will be displayed if the credentials are wrong --%>
				<c:if test="${not empty message}">
					<div class="row">
						<div class="col-md-offset-3 col-md-6">
							<div class="alert alert-danger">${message}</div>
						</div>
					</div>
				</c:if>
				<%--This will be displayed only when user has logged out --%>
				<c:if test="${not empty logout}">
					<div class="row">
						<div class="col-md-offset-3 col-md-6">
							<div class="alert alert-success">${logout}</div>
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-offset-3 col-md-6">

						<div class="panel panel-primary">

							<div class="panel-heading">
								<h4>Login</h4>
							</div>

							<div class="panel-body">
								<form action="${contextRoot}/login" method="POST"
									class="form-horizontal" id="loginForm">
									<div class="form-group">
										<label for="username" class="col-md-41 control-label">Email:
										</label>
										<div class="col-md-81">
											<input type="text" name="username" id="username"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-md-41 control-label">Password:
										</label>
										<div class="col-md-81">
											<input type="password" name="password" id="password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-41 col-md-81">
											<input type="submit" value="Login" class="btn btn-primary" />
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</div>
									</div>
								</form>

							</div>
							<div class="panel-footer">
								<div class="text-right">
									New User - <a href="${contextRoot}/register">Register Here</a>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
		</div>

		<!-- Footer ================================================================== -->



		<%@include file="./shared/footer.jsp"%>

		<!-- Placed at the end of the document so the pages load faster ============================================= -->
		<script src="${js}/jquery.js" type="text/javascript"></script>
		<!-- Jquery Validator -->
		<script src="${js}/jquery.validate.js" type="text/javascript"></script>
		<script src="${js}/bootstrap.min.js" type="text/javascript"></script>


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