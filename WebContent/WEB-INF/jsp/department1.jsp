<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="zdd" uri="http://zdd.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 留言列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">员工部门管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/department1/list.action">
			    <div class="form-group">
					<label for="id">编号</label> 
					 <input type="text" class="form-control" id="id" 
					                   value="${id}" name="id" />
				</div>
				<div class="form-group">
					<label for="department_number">部门编号</label> 
					 <input type="text" class="form-control" id="department_number" 
					                   value="${department_number}" name="department_number" />
				</div>
				<div class="form-group">
					<label for="department_name">部门名称</label>  
					 <input type="text" class="form-control" id="department_name" 
					                   value="${department_name}" name="department_name" />
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">员工部门列表</div>
				<!-- 公告信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>部门编号</th>
							<th>部门名称</th>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.department_number}</td>
								<td>${row.department_name}</td>
								
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/department1/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
