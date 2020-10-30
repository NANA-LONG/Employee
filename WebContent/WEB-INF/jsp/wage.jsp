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
			      action="${pageContext.request.contextPath }/wage/list.action">
				<div class="form-group">
					<label for="bills_number">出纳编号</label> 
					 <input type="text" class="form-control" id="bills_number" 
					                   value="${bills_number}" name="bills_number" />
				</div>
				
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newWageDialog" onclick="clearWage()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">员工工资列表</div>
				<!-- 员工工资列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>出纳编号</th>
							<th>员工姓名</th>
							<th>基本工资</th>
							<th>五险一金</th>
							<th>绩效奖金</th>
							<th>补贴</th>
							<th>发放时间</th>
							<th>加班费用</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
							    <td>${row.id}</td>
								<td>${row.bills_number}</td>
								<td>${row.username}</td>
								<td>${row.base_pay}</td>
								<td>${row.insurances_pay}</td>
								<td>${row.merit_pay}</td>
							    <td>${row.subsidy_pay}</td>
								<td>${row.sendtime}</td>
								<td>${row.overtime_pay}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#WageEditDialog" onclick="editWage(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteWage(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/wage/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建员工模态框 -->
<div class="modal fade" id="newWageDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建员工工资信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_wage_form">
					<div class="form-group">
						<label for="new_bills_number" class="col-sm-2 control-label">
						出纳编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_bills_number" placeholder="出纳编号" name="bills_number"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_username" class="col-sm-2 control-label">
						员工姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_username" placeholder="员工姓名" name="username" min="0" max="200"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_base_pay" class="col-sm-2 control-label">
						基本工资
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_base_pay" placeholder="基本工资" name="base_pay" min="0" max="200"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_insurances_pay" style="float:left;padding:7px 15px 0 27px;">
						五险一金</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_insurances_pay" placeholder="五险一金" name="insurances_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_merit_pay" style="float:left;padding:7px 15px 0 27px;">
						绩效奖金</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_merit_pay" placeholder="绩效奖金" name="merit_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_subsidy_pay" style="float:left;padding:7px 15px 0 27px;">
						补贴</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_subsidy_pay" placeholder="补贴" name="subsidy_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_sendtime" style="float:left;padding:7px 15px 0 27px;">
						发放时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_sendtime" placeholder="发放时间" name="sendtime" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_overtime_pay" style="float:left;padding:7px 15px 0 27px;">
						加班费用</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_overtime_pay" placeholder="加班费用" name="overtime_pay" min="0" max="200"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createWage()">创建员工</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改员工模态框 -->
<div class="modal fade" id="WageEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改员工奖罚信息</h4>
			</div>
	            <div class="modal-body">
				<form class="form-horizontal" id="edit_wage_form">
				<input type="hidden" id="edit_id" name="id"/>
				<div class="form-group">
						<label for="edit_bills_number" style="float:left;padding:7px 15px 0 27px;">
						出纳编号</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_bills_number" placeholder="出纳编号" name="bills_number" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_username" style="float:left;padding:7px 15px 0 27px;">
						绩效奖金</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_username" placeholder="员工姓名" name="username" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_base_pay" class="col-sm-2 control-label">
						基本工资
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_base_pay" placeholder="基本工资" name="base_pay" min="0" max="200"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_insurances_pay" style="float:left;padding:7px 15px 0 27px;">
						五险一金</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_insurances_pay" placeholder="五险一金" name="insurances_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_merit_pay" style="float:left;padding:7px 15px 0 27px;">
						绩效奖金</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_merit_pay" placeholder="绩效奖金" name="merit_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_subsidy_pay" style="float:left;padding:7px 15px 0 27px;">
						补贴</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_subsidy_pay" placeholder="补贴" name="subsidy_pay" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_sendtime" style="float:left;padding:7px 15px 0 27px;">
						发放时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_sendtime" placeholder="发放时间" name="sendtime" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_overtime_pay" style="float:left;padding:7px 15px 0 27px;">
						加班费用</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_overtime_pay" placeholder="加班费用" name="overtime_pay" min="0" max="200"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateWage()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建员工窗口中的数据
	function clearWage() {
		$("#new_bills_number").val("");
		$("#new_username").val("");
	    $("#new_base_pay").val("")
	    $("#new_insurances_pay").val("")
	    $("#new_merit_pay").val("")
	    $("#new_subsidy_pay").val("")
	    $("#new_sendtime").val("")
	    $("#new_overtime_pay").val("");
	}
	//创建员工
	function createWage(){
		$.post("<%=basePath%>wage/create.action",
		$("#new_wage_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("员工创建成功！");
	            window.location.reload();
	        }else{
	            alert("员工创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的员工信息
	function editWage(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>wage/getWageById.action",
	        data:{"id":id},
	        success:function(data) {
	        	    $("#edit_id").val(data.id);
	        	    $("#edit_bills_number").val(data.bills_number);
	        	    $("#edit_username").val(data.username);
		            $("#edit_base_pay").val(data.base_pay)
		            $("#edit_insurances_pay").val(data.insurances_pay)
		            $("#edit_merit_pay").val(data.merit_pay)
		            $("#edit_subsidy_pay").val(data.subsidy_pay)
		            $("#edit_sendtime").val(data.sendtime)
		            $("#edit_overtime_pay").val(data.overtime_pay);
	            
	        }
	    });
	}
	// 执行修改员工操作
	function updateWage() {
		$.post("<%=basePath%>wage/update.action",$("#edit_wage_form").serialize(),function(data){
			if(data =="OK"){
				alert("员工信息更新成功！");
				window.location.reload();
			}else{
				alert("员工信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除员工
	function deleteWage(id) {
	    if(confirm('确实要删除该员工吗?')) {
	$.post("<%=basePath%>wage/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("员工删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除员工失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>