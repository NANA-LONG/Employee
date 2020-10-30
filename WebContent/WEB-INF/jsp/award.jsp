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
			      action="${pageContext.request.contextPath }/award/list.action">
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
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newAwardDialog" onclick="clearAward()">添加</a>
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
							<th>操作</th>
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
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#awardEditDialog" onclick= "editAward(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteAward(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<zdd:page url="${pageContext.request.contextPath }/award/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建员工模态框 -->
<div class="modal fade" id="newAwardDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建员工奖罚信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_award_form">
					<div class="form-group">
						<label for="new_number" class="col-sm-2 control-label">
						奖罚编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_number" placeholder="奖罚编号" name="number"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_reason" style="float:left;padding:7px 15px 0 27px;">
						奖罚原因</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_reason" placeholder="奖罚原因" name="reason" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_name" style="float:left;padding:7px 15px 0 27px;">
						奖罚名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_name" placeholder="奖罚名称" name="name" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_explains" style="float:left;padding:7px 15px 0 27px;">
						奖罚说明</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_explains" placeholder="奖罚说明" name="explains" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_createtime" style="float:left;padding:7px 15px 0 27px;">
						创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_createtime" placeholder="创建时间" name="createtime" min="0" max="200"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createAward()">创建员工</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改员工模态框 -->
<div class="modal fade" id="awardEditDialog" tabindex="-1" role="dialog"
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
				<form class="form-horizontal" id="edit_award_form">
                 <input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_number" class="col-sm-2 control-label">
						奖罚编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_number" placeholder="奖罚编号" name="number"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_reason" style="float:left;padding:7px 15px 0 27px;">
						奖罚原因</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_reason" placeholder="奖罚原因" name="reason" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_name" style="float:left;padding:7px 15px 0 27px;">
						奖罚名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_name" placeholder="奖罚名称" name="name" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_explains" style="float:left;padding:7px 15px 0 27px;">
						奖罚说明</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_explains" placeholder="奖罚说明" name="explains" min="0" max="200"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_createtime" style="float:left;padding:7px 15px 0 27px;">
						创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_createtime" placeholder="创建时间" name="createtime" min="0" max="200"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateAward()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建员工窗口中的数据
	function clearAward() {
	    $("#new_number").val("");
	    $("#new_name").val("")
	    $("#new_reason").val("")
	    $("#new_explains").val("")
	    $("#new_createtime").val("");
	}
	//创建员工
	function createAward(){
		$.post("<%=basePath%>award/create.action",
		$("#new_award_form").serialize(),function(data){
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
	function editAward(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>award/getAwardById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	            $("#edit_number").val(data.number);
	            $("#edit_name").val(data.name)
	            $("#edit_reason").val(data.reason);
	            $("#edit_explains").val(data.explains);
	            $("#edit_createtime").val(data.createtime)
	            
	        }
	    });
	}
	// 执行修改员工操作
	function updateAward() {
		$.post("<%=basePath%>award/update.action",$("#edit_award_form").serialize(),function(data){
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
	function deleteAward(id) {
	    if(confirm('确实要删除该员工吗?')) {
	$.post("<%=basePath%>award/delete.action",{"id":id},
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