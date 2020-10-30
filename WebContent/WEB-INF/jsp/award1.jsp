<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="zdd" uri="http://zdd.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 员工列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">员工奖惩管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	 <div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/award1/list.action">
				<div class="form-group">
					<label for="number">奖罚编号</label> 
					 <input type="text" class="form-control" id="number" 
					                   value="${number}" name="number" />
				</div>
				<div class="form-group">
					<label for="name">奖罚名称</label> 
					 <input type="text" class="form-control" id="name" 
					                   value="${name}" name="name" />
				</div>	
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">员工工资列表</div>
				<!-- 员工工资列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>奖罚编号</th>
							<th>奖罚名称</th>
							<th>奖罚原因</th>
							<th>奖罚说明</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.number}</td>
								<td>${row.name}</td>
								<td>${row.reason}</td>
								<td>${row.explains}</td>
								<td>${row.createtime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/award1/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
