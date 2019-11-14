<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题预览</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/exam.css" rel="stylesheet" type="text/css">
		<link href="resources/css/style.css" rel="stylesheet">
		
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#">网站管理系统</a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						<c:choose>
							<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
								<div id="login-info-user">
									
									<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
									<span>|</span>
									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
								</div>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="user-register">用户注册</a>
								<a class="btn btn-success" href="user-login-page">登录</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="#"><i class="fa fa-home"></i>网站首页</a>
						</li>
						<li class="active">
							<a href="admin/question-list"><i class="fa fa-edit"></i>试题管理</a>
						</li>

						<li>
							<a href="admin/exampaper-list"><i class="fa fa-file-text-o"></i>试卷管理</a>
						</li>
						<li>
							<a href="admin/user-list"><i class="fa fa-user"></i>会员管理</a>
						</li>
						<li>
							<a href="admin/field-list-1"><i class="fa fa-cloud"></i>知识点管理</a>
						</li>
						<li>
							<a href="admin/sys-backup"><i class="fa fa-cogs"></i>网站设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							<li>
								<a href="admin/question-list"> <i class="fa fa-list-ul"></i> 试题管理 </a>

							</li>
							<li class="active">
								<a> <i class="fa fa-file-text"></i> 试题预览 </a>

							</li>
							<li>
								<a href="admin/question-add"> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>

							</li>
							<li>
								<a href="admin/question-import"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>

							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1 style="margin-left: -15px;"><i class="fa fa-file-text"></i> 试题预览 </h1>
						</div>
						<div class="page-content row">
							<div class="def-bk" id="bk-exampaper">
								<div class="expand-bk-content" id="bk-conent-exampaper">
									<ul id="exampaper-body" style="padding:0px;">
										<!--  判断是不是选择题  做出不同的显示 -->
										<c:if test="${question.question_type ==1}">
										     <li class="ex-question">
										     <span>下面选项正确的是?</span>
										     <ul  style="list-style:none">
										         <li><input  type="radio" name="1">A.A</li>
										         <li><input  type="radio" name="1">B.B</li>
										         <li><input  type="radio" name="1">C.C</li>
										         <li><input  type="radio" name="1">D.D</li>
										     </ul>
										</li>
										</c:if>
										<c:if test="${question.question_type!=1}">
										         <li class="ex-question">
										         <div>
										             <h1>请回答Spring的MVC组件<h1>
										              <h3>好好思考<h3>
										         </div>
										         <textarea rows="5" cols="80"></textarea>
										     </li>
										</c:if>					
										
									</ul>
								
								</div>
								

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/jquery-ui-1.9.2.custom.min.js"></script>
		
		<script type="text/javascript" src="resources/js/uploadify/jquery.uploadify3.1Fixed.js"></script>
		<script type="text/javascript" src="resources/js/question-upload-img.js"></script>
		<script type="text/javascript" src="resources/js/field-2-point.js"></script>
		<script type="text/javascript" src="resources/js/question-add.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
								$(function(){
											$("#delete-question-btn").click(function(){
												var result = confirm("确定删除吗？删除后将不可恢复");
												if(result == true){
													jQuery.ajax({
														headers : {
															'Accept' : 'application/json',
															'Content-Type' : 'application/json'
														},
		  												type : "GET",
														url : 'admin/delete-question/' + $(".question-id").text(),
														success : function(message,tst,jqXHR) {
															if(!util.checkSessionOut(jqXHR))return false;
															if (message.result == "success") {
																util.success("删除成功！", function(){
																	window.opener.location.reload(false);
																	window.close();
																});
															} else {
																util.error("操作失败请稍后尝试");
															}
														},
														error : function(jqXHR, textStatus) {
															util.error("操作失败请稍后尝试");
														}
													});
												}
												
											});
											
											
										
										
									});
		</script>
	</body>
</html>