<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="zdd" uri="http://zdd.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>员工信息管理系统</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- staffom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h3>
<div align="center" style="color:blue">
   <script language=JavaScript >
var today = new Date();
var strDate = ( today.getYear() + "年" + (today.getMonth() + 1) + "月" + today.getDate() + "日");
/*var hh = today.getHours();
if(hh<10) hh = '0' + hh;
var mm = today.getMinutes();
if(mm<10) mm = '0' + mm;
var ss = today.getSeconds();
if(ss<10) ss = '0' + ss;
*/
var n_day = today.getDay();
var ww;

switch (n_day)
{
case 0:{ww =  "星期日";} break;
case 1:{ww =  "星期一";} break;
case 2:{ww =  "星期二";} break;
case 3:{ww =  "星期三";} break;
case 4:{ww =  "星期四";} break;
case 5:{ww =  "星期五";} break;
case 6:{ww =  "星期六";} break;
case 7:{ww =  "星期日";} break;
}
strDate="今天是:" + ww+"</font>";
document.write(strDate);
 </script>
</div>
</h3>

<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>staff/list.action">员工信息管理系统 v1.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
				    </a>
				</li>
				
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 任务通知 start -->
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			    <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 1</strong> 
								<span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 2</strong> 
								<span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 任务通知 end -->
		<!-- 消息通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.username}
				    </a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group staff-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/staff/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 员工信息管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/award/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 员工奖惩管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/department/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 员工部门管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/wage/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 员工工资管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/users/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 用户信息管理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <c:if test="${func == 'staff'}">
    <!-- 员工列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">员工信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/staff/list.action">
					<div class="form-group">
						<label for="employee_name">员工姓名</label> 
						<input type="text" class="form-control" id="employee_name" 
						                   value="${employee_name}" name="employee_name" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newStaffDialog" onclick="clearStaff()">添加</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">员工信息列表</div>
					<!-- 员工信息列表 -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>部门编号</th>
								<th>员工姓名</th>
								<th>民族</th>
								<th>身份证号</th>
								<th>性别</th>
								<th>职位</th>
								<th>手机号</th>
								<th>邮箱</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.department_number}</td>
									<td>${row.employee_name}</td>
									<td>${row.nation}</td>
									<td>${row.card_id}</td>
									<td>${row.sex}</td>
									<td>${row.role}</td>
								    <td>${row.mobile_number}</td>
								    <td>${row.email}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffEditDialog" onclick= "editStaff(${row.id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteStaff(${row.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<zdd:page url="${pageContext.request.contextPath }/staff/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 员工列表查询部分  end-->
	</c:if>>
	<c:if test="${func == 'department'}">
     <jsp:include page="department.jsp" flush="true" />
	</c:if>>
	<c:if test="${func == 'award'}">
     <jsp:include page="award.jsp" flush="true" />
	</c:if>>
	<c:if test="${func == 'wage'}">
     <jsp:include page="wage.jsp" flush="true" />
	</c:if>>
	<c:if test="${func == 'users'}">
     <jsp:include page="users.jsp" flush="true" />
	</c:if>>
</div>
<!-- 创建员工模态框 -->
<div class="modal fade" id="newStaffDialog" tabindex="-1" role="dialog"
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
				<form class="form-horizontal" id="new_staff_form">
				<div class="form-group">
						<label for="new_employee_id" class="col-sm-2 control-label">员工编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_employee_id" placeholder="员工编号" name="employee_id"/>
						</div>
						</div>
					<div class="form-group">
						<label for="new_department_number" class="col-sm-2 control-label">
						    部门编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_department_number" placeholder="部门编号" name="department_number" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_employee_name" class="col-sm-2 control-label">
						    员工姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_employee_name" placeholder="员工姓名" name="employee_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_nation" class="col-sm-2 control-label">
						   民族
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_nation" placeholder="民族" name="nation" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_card_id" class="col-sm-2 control-label">
						   身份证号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_card_id" placeholder="身份证号" name="card_id" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_sex" class="col-sm-2 control-label">
						   性别
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_sex" placeholder=" 性别" name="sex" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_role" class="col-sm-2 control-label">
						   职位
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_role" placeholder="职位" name="role" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_mobile_number" class="col-sm-2 control-label">
						   手机号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile_number" placeholder="手机号" name="mobile_number" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_email" class="col-sm-2 control-label">
						   电子邮箱
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_email" placeholder="电子邮箱" name="email" />
						</div>
					</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createStaff()">创建员工</button>
			</div>
		</form>
	  </div>
	 </div>
	</div>
</div>
<!-- 修改员工模态框 -->
<div class="modal fade" id="staffEditDialog" tabindex="-1" role="dialog"
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
				<form class="form-horizontal" id="edit_staff_form">
				<input type="hidden" id="edit_id" name="id"/>
				<div class="form-group">
						<label for="edit_employee_id" class="col-sm-2 control-label">
						    员工编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_employee_id" placeholder="员工编号" name="employee_id" />
						</div>
			         </div>
			<div class="form-group">
						<label for="edit_department_number" class="col-sm-2 control-label">
						    部门编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_department_number" placeholder="部门编号" name="department_number" />
						</div>
			         </div>
					<div class="form-group">
						<label for="edit_employee_name" class="col-sm-2 control-label">
						    员工姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_employee_name" placeholder="员工姓名" name="employee_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_nation" class="col-sm-2 control-label">
						   民族
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_nation" placeholder="民族" name="nation" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_card_id" class="col-sm-2 control-label">
						   身份证号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_card_id" placeholder="身份证号" name="card_id" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_sex" class="col-sm-2 control-label">
						   性别
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_sex" placeholder="性别" name="sex" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_role" class="col-sm-2 control-label">
						   职位
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_role" placeholder="职位" name="role" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_mobile_number" class="col-sm-2 control-label">
						   手机号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile_number" placeholder="手机号" name="mobile_number" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_email" class="col-sm-2 control-label">
						   电子邮箱
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_email" placeholder="电子邮箱" name="email" />
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateStaff()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 员工列表查询部分  end-->
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建员工窗口中的数据
	function clearStaff() {
		$("#new_employee_id").val("");
	    $("#new_department_number").val("");
	    $("#new_employee_name").val("")
	    $("#new_nation").val("")
	    $("#new_card_id").val("")
	    $("#new_sex").val("");
	    $("#new_role").val("");
	    $("#new_mobile_number").val("");
	    $("#new_email").val("");
	}
	// 创建用户
	function createStaff() {
	$.post("<%=basePath%>staff/create.action",
	$("#new_staff_form").serialize(),function(data){
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
	function editStaff(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>staff/getStaffById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	        	$("#edit_employee_id").val(data.employee_id);
	            $("#edit_department_number").val(data.partment_number);
	            $("#edit_employee_name").val(data.employee_name);
	            $("#edit_nation").val(data.nation)
	            $("#edit_card_id").val(data.card_id)
	            $("#edit_sex").val(data.sex)
	            $("#edit_role").val(data.role);
	            $("#edit_mobile_number").val(data.mobile_number);
	            $("#edit_email").val(data.email);
	        }
	    });
	}	
    // 执行修改员工操作
	function updateStaff() {
		$.post("<%=basePath%>staff/update.action",$("#edit_staff_form").serialize(),function(data){
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
	function deleteStaff(id) {
	    if(confirm('确定要删除该员工吗?')) {
	$.post("<%=basePath%>staff/delete.action",{"id":id},
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

</body>
</html>