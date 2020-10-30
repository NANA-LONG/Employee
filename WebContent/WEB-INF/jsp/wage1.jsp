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
			<h1 class="page-header">员工工资管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	 <div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/wage1/list.action">
				<div class="form-group">
					<label for="bills_number">出纳编号</label> 
					 <input type="text" class="form-control" id="bills_number" 
					                   value="${bills_number}" name="bills_number" />
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
							<th>出纳编号</th>
							<th>基本工资</th>
							<th>五险一金</th>
							<th>绩效奖金</th>
							<th>补贴</th>
							<th>发放时间</th>
							<th>加班费用</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.bills_number}</td>
								<td>${row.base_pay}</td>
								<td>${row.insurances_pay}</td>
								<td>${row.merit_pay}</td>
							    <td>${row.subsidy_pay}</td>
								<td>${row.sendtime}</td>
								<td>${row.overtime_pay}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/wage1/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>