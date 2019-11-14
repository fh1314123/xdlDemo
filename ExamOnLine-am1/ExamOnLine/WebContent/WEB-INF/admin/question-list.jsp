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
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			.examing-point{
				display:block;
				font-size:10px;
				margin-top:5px;
			}
			.question-name-td{
				width:300px;
			}
			.change-property{
				cursor:pointer;
			}
			.add-tag-btn{
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="add-admin.html">网站管理系统</a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						 
								<div id="login-info-user">
									
									<a href="add-admin.html" id="system-info-account" target="_blank">张三</a>
									<span>|</span>
									<a href="login.html"><i class="fa fa-sign-out"></i> 退出</a>
								</div>
							 
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
							<a href="home.html"><i class="fa fa-home"></i>网站首页</a>
						</li>
						<li class="active">
							<a href="question-list.html"><i class="fa fa-edit"></i>试题管理</a>
						</li>
						<li>
							<a href="exampaper-list.html"><i class="fa fa-file-text-o"></i>试卷管理</a>
						</li>
						<li>
							<a href="user-list.html"><i class="fa fa-user"></i>会员管理</a>
						</li>
						<li>
							<a href="field-list-1.html"><i class="fa fa-cloud"></i>知识点管理</a>
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
							<li class="active">
								<a href="question-list.html"> <i class="fa fa-list-ul"></i> 试题管理 </a>
							</li>
							<li>
								<a href="question-add.html"> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>
							</li>
							<li>
								<a href="question-import.html"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 试题管理 </h1>
						</div>
						<div class="page-content row">

							<div id="question-filter">

								<dl id="question-filter-field">
									<dt>
										题库：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.fieldId == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${fieldList}" var="field">
											<c:choose>
												<c:when test="${questionFilter.fieldId == field.fieldId }">
													<span class="label label-info" data-id="${field.fieldId}">题库1</span>
												</c:when>
												<c:otherwise>
													<span data-id="${field.fieldId}">题库2</span>
												</c:otherwise>
											</c:choose>	
										</c:forEach>
									</dd>
								</dl>
								<dl id="question-filter-knowledge">
									<dt>
										知识分类：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.knowledge == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${knowledgeList}" var="knowledge">
											<c:choose>
												<c:when test="${questionFilter.knowledge == knowledge.pointId }">
													<span data-id="${knowledge.pointId}" class="label label-info">知识分类1</span>
												</c:when>
												<c:otherwise>
													<span data-id="${knowledge.pointId}">知识分类2</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</dd>
								</dl>

								<dl id="question-filter-qt">
									<dt>
										试题类型：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.questionType == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${questionTypeList}" var="questionType">
											<c:choose>
												<c:when test="${questionFilter.questionType == questionType.id }">
													<span data-id="${questionType.id}" class="label label-info">试题类型1</span>
												</c:when>
												<c:otherwise>
													<span data-id="${questionType.id}">试题类型2</span>
												</c:otherwise>
											</c:choose>
											
											
										</c:forEach>

									</dd>
								</dl>
								
							</div>
							<div id="question-list">
								<input id="field-id-hidden" value="${fieldId }" type="hidden">
								<input id="knowledge-hidden" value="${knowledge }" type="hidden">
								<input id="question-type-hidden" value="${questionType }" type="hidden">
								<input id="search-param-hidden" value="${searchParam }" type="hidden">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td><td>ID</td><td class="question-name-td" style="width:240px">试题名称</td><td style="width:60px">试题类型</td><td>专业</td><td>知识类</td><td>操作</td>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${questionList }" var="items">
											<tr>
												<td>
												<input type="checkbox" value="${items.id }">
												</td><td>1</td>
												<td>
													<a href="admin/question-preview/${items.id }" target="_blank" title="预览">试题1</a>
													 
													<span class="examing-point">知识点1 </span>
												</td>
												
												
												<td>试题类型</td><td>专业1</td><td>知识点2</td>
												 
												<td style="width:50px;">
													<a class="change-property">修改</a>
												</td>
											</tr>
										</c:forEach>
										

									</tbody><tfoot></tfoot>
								</table>
								<div class="modal fade" id="change-property-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													    	<div class="modal-header">
														        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														        <h6 class="modal-title" id="myModalLabel">修改分类</h6>
														     </div>
														     <div class="modal-body">
														     	<form id="question-edit-form">
														     		<span id="add-update-questionid" style="display:none;"></span>
															     	
														     		<div class="form-line exampaper-type" id="aq-course1">
																		<span class="form-label"><span class="warning-label">*</span>专业：</span>
																		<select id="field-select" class="df-input-narrow">
																			<c:forEach items="${fieldList}" var="field">
																				<option value="${field.fieldId}">${field.fieldName} </option>
																			</c:forEach>
																		</select><span class="form-message"></span>
																	</div>
														     		<div class="form-line exampaper-type" id="aq-course2">
																		<span class="form-label"><span class="warning-label">*</span>知识类：</span>
																		<select id="point-from-select" class="df-input-narrow">
																			<c:forEach items="${knowledgeList}" var="item">
																				<option value="${item.pointId}">${item.pointName} </option>
																			</c:forEach>
																		</select><span class="form-message"></span>
																	</div>
																	<div class="form-line exampaper-type" id="aq-tag">
																		<span class="form-label"><span class="warning-label">*</span>标签：</span>
																		<select id="tag-from-select" class="df-input-narrow">
																			<c:forEach items="${tagList }" var="item">
																				<option value="${item.tagId }" data-privatee="${item.privatee }" data-creator="${item.creator}" data-memo="${item.memo }" data-createtime="${item.createTime }">${item.tagName } </option>
																			</c:forEach>
																			
																		</select><a class="add-tag-btn">添加</a><span class="form-message"></span>
																		
																		<div class="q-label-list">
																		</div>
																	</div>
																</form>
														     </div>
														     <div class="modal-footer">
				        										<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
				        										<button id="update-exampaper-btn" type="button" class="btn btn-primary">确定修改</button>
				      										 </div>
													    </div>
													  </div>
								</div>
							</div>
							<div class="page-link-content">
								<ul class="pagination pagination-sm">1  2  3</ul>
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
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/question-list.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/field-2-point.js"></script>
		
		<script>
			$(function(){
				$(".change-property").click(function(){
					$("#change-property-modal").modal({backdrop:true,keyboard:true});
					var paper_id =  $(this).parent().parent().find(":checkbox").val();
					$("#add-update-questionid").text(paper_id);
					$.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "GET",
						url : "teacher/question-tag/" + paper_id,
						success : function(message, tst, jqXHR) {
							if (!util.checkSessionOut(jqXHR))
								return false;
							if (message.result == "success") {
								//将message.object里面的内容写到 div（class=q-label-list）里面
								var innerHtml = "";
								$.each(message.object,function(index,element){
									innerHtml += "<span class=\"label label-info q-label-item\" data-privatee=" 
										+ element.privatee + " data-creator=" + element.creator
										+" data-memo="+ element.memo
										+" data-id="+ element.tagId
										+ ">" + element.tagName + "  <i class=\"fa fa-times\"></i>	</span>";
								});
								$(".q-label-list").html(innerHtml);
							} else {
								util.error("操作失败请稍后尝试:" + message.result);
							}

						},
						error : function(jqXHR, textStatus) {
							util.error("操作失败请稍后尝试");
						}
					});					
				});
				
				$(".add-tag-btn").click(function(){
					var label_ids = $(".q-label-item");
					var flag = 0;
					label_ids.each(function(){
						if($(this).data("id") == $("#tag-from-select").val())
							flag = 1;
					});
					if(flag == 0){
						var selected = $("#tag-from-select").find("option:selected");
					
						$(".q-label-list").append("<span class=\"label label-info q-label-item\" data-privatee=" 
								+ selected.data("privatee")  + " data-creator=" + selected.data("creator") 
								+" data-memo="+ selected.data("memo") 
								+" data-id="+ $("#tag-from-select").val()
								+" data-createTime="+ selected.data("createTime") +">" 
								+ $("#tag-from-select :selected").text() + "  <i class=\"fa fa-times\"></i>	</span>");
					}
					else{
						util.error("不能重复添加");
					}
				});
				
				$("#update-exampaper-btn").click(function(){
					
					if($("#point-from-select").val()==null||$("#point-from-select").val()==""){
						util.error("请选择知识类");
					}
					$("#point-from-select").val();
					var data = new Array();
					
					$(".q-label-item").each(function(){
						var tag = new Object();
						tag.tagId = $(this).data("id");
						tag.questionId = $("#add-update-questionid").text();
						data.push(tag);
					});
					$.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						url : "admin/question-update/" + $("#add-update-questionid").text() + "/" +  $("#point-from-select").val(),
						data : JSON.stringify(data),
						success : function(message, tst, jqXHR) {
							if (!util.checkSessionOut(jqXHR))
								return false;
							if (message.result == "success") {
								util.success("修改成功", function(){
									window.location.reload();
								});
							} else {
								util.error("操作失败请稍后尝试:" + message.result);
							}

						},
						error : function(jqXHR, textStatus) {
							util.error("操作失败请稍后尝试");
						}
					});
					
					return false;
				});
				
				$(".q-label-list").on("click",".fa",function(){
					$(this).parent().remove();
				});
				
				
			});
		
		
		
		</script>
	</body>
</html>

