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
			<div id="logoArea" class="navbar">
	<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
		class="btn btn-navbar"> <span class="icon-bar"></span> <span
		class="icon-bar"></span> <span class="icon-bar"></span>
	</a>
	<div class="navbar-inner">
		<a class="brand" href="${contextRoot}/home">Home</a>
				<div class="content">
			<div class="container">
			<div class="row">
			<div class="col-xs-12">
			<div class="jumbotron">
			<h1>${errorTitle}</h1>
			<hr/>
			<blockquote style="word-wrap : break-word">
			${errorDescription }
			
			</blockquote>
			</div>
			</div>
			</div>
			
			</div>
			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Footer ================================================================== -->
		<%@include file="./shared/footer.jsp"%>
		
	</div>
</body>
</html>