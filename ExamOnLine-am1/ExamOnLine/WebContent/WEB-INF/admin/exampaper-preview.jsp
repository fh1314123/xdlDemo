<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html>
  <head>
   <base href="/ExamOnLine/">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>兄弟连java在线考试系统</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="${basePath }resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			#add-more-qt-to-paper{
				cursor: pointer;
				color: #1ba1e2;
			}
			#add-more-qt-to-paper:hover{
				color:#ff7f74;
			}
			#add-more-qt-to-paper i{
				color: #47a447;
				cursor: pointer;
				margin-right:5px;	
			}
			
			#qt-selector-iframe{
				border:none;
				height:600px;
			}
			.tmp-ques-remove{
				margin-left:10px;
			}
			
			.question-point{
				padding:0 8px;
				margin:0 2px;
			}
		</style>
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
						<li>
							<a href="question-list.html"><i class="fa fa-edit"></i>试题管理</a>
						</li>

						<li class="active">
							<a href="exampaper-list.html"><i class="fa fa-file-text-o"></i>试卷管理</a>
						</li>
						<li>
							<a href="user-list.html"><i class="fa fa-user"></i>会员管理</a>
						</li>
						<li>
							<a href="field-list.html"><i class="fa fa-cloud"></i>知识点管理</a>
						</li>
						<li>
							<a href="sys-backup.html"><i class="fa fa-cogs"></i>网站设置</a>
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
								<a href="exampaper-list.html"> <i class="fa fa-list-ul"></i> 试卷管理 </a>

							</li>
							<li>
								<a href="exampaper-add.html"> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>

							</li>
							<li class="active">
								<a> <i class="fa fa-bar-chart-o"></i> 预览试卷 </a>
							</li>

						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1 style="margin-left: -15px;"><i class="fa fa-file-text"></i> 预览试卷 </h1>
						</div>
						<div class="page-content row">
							<div class="def-bk" id="bk-exampaper">

								<div class="expand-bk-content" id="bk-conent-exampaper">
									<div id="exampaper-header">
										<div id="exampaper-title">
											<i class="fa fa-send"></i>
											<span id="exampaper-title-name">${exampapername} </span>
											<span style="display:none;" id="exampaper-id">${exampaperid}</span>
											
										</div>
										<div id="exampaper-desc-container">
											<div id="exampaper-desc" class="exampaper-filter">
												
											
											</div>
											<div style="margin-top: 5px;">
												<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
												<!-- <span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span>增加更多题目</span></span> -->
											    
											</div>
											<ul id="ex-body" >
										<!--  暂时把客观题 和 主观题 分开   以后可以更详细-->
										<!--  选择题   -->
										<c:forEach  items="${paper.questions}"  var="question">
											<c:if test="${question.question_type_id==1}">
												<li class="${question.question_type_id }">
												     <div>测试题目是否有正确答案</div>
												     <ul  style="list-style:none">
												         <li><input  type="radio" name="${question.id}" id="${question.id}">A.A</li>
												         <li><input  type="radio" name="${question.id}" id="${question.id}">B.B</li>
												         <li><input  type="radio" name="${question.id}" id="${question.id}">C.C</li>
												         <li><input  type="radio" name="${question.id}" id="${question.id}">D.D</li>
												     </ul>
												</li>
											</c:if>
										    <c:if test="${question.question_type_id==6}">
												<li class="${question.question_type_id }">
												     <div>${question.content }</div>
												     <textarea rows="10" cols="80" ></textarea>
												</li>
										    </c:if>
										</c:forEach>
									</ul>
									
									
									 
										</div>
										
										
									</div>
									
									<div id="exampaper-footer">
										<div id="question-navi">
										
										     <div id="question-navi-content">
										     </div>
										</div>
										<div style="padding-left:30px;">
											<!-- <button class="btn btn-danger"><i class="fa fa-save"></i>保存试卷</button> -->
										</div>
										
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="question-selector-modal">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">选择试题添加到试卷中</h4>
						      </div>
						      <div class="modal-body">
						        <iframe  id="qt-selector-iframe" src="admin/questionfilterdialog-0-0-0-0-1.html" width="100%"></iframe>
						      </div>
						      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
							        <button id="add-list-to-exampaper" type="button" class="btn btn-primary">添加选中</button>
							      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			<div class="modal fade" id="question-point-modal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">修改分数</h4>
						      </div>
						      <div class="modal-body">
						        	<form>
										<div class="form-line qt-point-destination">
											<span class="form-label">分数：</span>
											<label></label>
											<input type="text" value=""/>
										</div>
										<div class="form-line">
											<button class="btn btn-sm btn-success" id="update-point-btn"><i class="fa fa-check"></i>仅修改第<span id="qt-point-target-index"></span>题</button>
											<button class="btn btn-sm btn-warning" id="update-point-type-btn"><i class="fa fa-random"></i>批量更新该题型</button>
										</div>
									</form> 

						      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			
		</div>


		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/exampaper-preview.js"></script>
		
	</body>
</html>