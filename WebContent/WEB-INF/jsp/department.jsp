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
			      action="${pageContext.request.contextPath }/department/list.action">
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
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newDepartmentDialog" onclick="clearDepartment()">添加</a>
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
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.department_number}</td>
								<td>${row.department_name}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#departmentEditDialog" onclick= "editDepartment(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteDepartment(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/department/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建留言模态框 -->
<div class="modal fade" id="newDepartmentDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建员工部门信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_department_form">
					<div class="form-group">
						<label for="new_department_number" class="col-sm-2 control-label">部门编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_department_number" placeholder="部门编号" name="department_number"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_department_name" class="col-sm-2 control-label">部门名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_department_name" placeholder="部门名称" name="department_name"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createDepartment()">创建员工部门</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改留言模态框 -->
<div class="modal fade" id="departmentEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改员工部门信息</h4>
			</div>
			
			<div class="modal-body">
				<form class="form-horizontal" id="edit_department_form">
				<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_department_number" class="col-sm-2 control-label">部门编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_department_number" placeholder="部门编号" name="department_number"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_department_name" class="col-sm-2 control-label">部门名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_department_name" placeholder="部门名称" name="department_name"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateDepartment()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建留言窗口中的数据
	function clearDepartment() {
	    $("#new_department_number").val("");
	    $("#new_department_name").val("")
	}
	//创建留言
	function createDepartment(){
		$.post("<%=basePath%>department/create.action",
		$("#new_department_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("员工部门创建成功！");
	            window.location.reload();
	        }else{
	            alert("员工部门创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的留言信息
	function editDepartment(id) { 
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>department/getDepartmentById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	  			console.log(data.id)
	            $("#edit_department_number").val(data.department_number);
	            $("#edit_department_name").val(data.department_name);
	        }
	    });
	}
	// 执行修改留言操作
	function updateDepartment() {
		$.post("<%=basePath%>department/update.action",$("#edit_department_form").serialize(),function(data){
			if(data =="OK"){
				alert("员工部门信息更新成功！");
				window.location.reload();
			}else{
				alert("员工部门信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除留言
	function deleteDepartment(id) {
	    if(confirm('确实要删除该员工部门吗?')) {
	$.post("<%=basePath%>department/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("员工部门删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除员工部门失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>