<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="zdd" uri="http://zdd.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 学生列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">管理员管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/users/list.action">
				<div class="form-group">
					<label for="username">员工姓名</label> 
					 <input type="text" class="form-control" id="username" 
					                   value="${username}" name="username" />
				</div>
				
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newUserDialog" onclick="clearUser()">添加</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">员工信息列表</div>
				<!-- 员工信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>用户名</th>
							<th>密码</th>
							<th>管理员</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
							    <td>${row.id}</td>
								<td>${row.username}</td>
								<td>${row.password}</td>
								<td>${row.role}</td>
								
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick= "editUser(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/users/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
<!-- 创建学生模态框 -->
<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建员工信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_user_form">
					<div class="form-group">
						<label for="new_username" class="col-sm-2 control-label">
						    用户姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_username" placeholder="用户姓名" name="username"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_password" class="col-sm-2 control-label">
						    用户密码
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_password" placeholder="用户密码" name="password"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_role" class="col-sm-2 control-label">
						    用户身份
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_role" placeholder="身份管理" name="role"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createUser()">创建员工</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改员工模态框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_username" class="col-sm-2 control-label">员工姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_username" placeholder="用户姓名" name="username" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password" style="float:left;padding:7px 15px 0 27px;">用户密码</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password" placeholder="用户密码" name="password" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_role" style="float:left;padding:7px 15px 0 27px;">身份管理</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_role" placeholder="身份管理" name="role" min="0" max="200"/>
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建学生窗口中的数据
	function clearUser() {
	    $("#new_username").val("");
	    $("#new_password").val("")
	    $("#new_role").val("")
	   
	}
	//创建学生
	function createUser(){
		$.post("<%=basePath%>user/create.action",
		$("#new_user_form").serialize(),function(data){
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
	function editUser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>user/getUserById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	        	$("#edit_username").val(data.username);
	            $("#edit_password").val(data.password);
	            $("#edit_role").val(data.role)
	               
	        }
	    });
	}
	// 执行修改员工操作
	function updateUser() {
		$.post("<%=basePath%>user/update.action",$("#edit_user_form").serialize(),function(data){
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
	function deleteUser(id) {
	    if(confirm('确实要删除该员工吗?')) {
	$.post("<%=basePath%>user/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("员工删除成功！");
	                window.location.reload();
	            }else{
	                alert("员工删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>