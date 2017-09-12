<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<script>
		//查询用户信息
		function detailUser(userId){
			$("#innerDetailUserModal").load("user?op=queryById&userId="+userId);
		};
		//编辑用户信息
		function editUser(userId){
			$("#innerEditUserModal").load("user?op=inputEdit&userId="+userId);
		};
		//删除用户数据
		function deleteUser(userId,loginName){
			var message = "您确定删除登陆名为为["+loginName+"]的用户吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerUserListDiv").load("user?op=delete&userId="+userId);
	            	alertify.success("删除成功");
	            }  
	        });
		};
	</script>
	<style>
    	th{
    		text-align: center;
    	}
    	td{
    		text-align: center;
    	}
    </style>
    			<div style="height:285px;">
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th><input type="checkbox"  onclick="ckAll(this)"></th>
								<th>用户编号</th>
								<th>登录昵称</th>
								<th>消费额度</th>
								<th>等级名称</th>
								<th>注册时间</th>
								<th>用户状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="user" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" uname="${user.loginName }" value="${user.userId }"></td>
								<td>${user.userId }</td>
								<td>${user.loginName }</td>
								<td>${user.consume }</td>
								<td>${user.levelName }</td>
								<td>${user.registerTime }</td>
								<td>${user.userState==0?'可登陆':'不能登陆' }</td>
								<td>
									<a data-toggle="modal" data-target="#detailUserModal" onclick="detailUser('${user.userId }')" data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="modal" data-target="#editUserModal" onclick="editUser('${user.userId }')"  data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									<a data-toggle="tooltip" onclick="deleteUser('${user.userId }',${user.loginName })" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<ul class="pagination">
				  	<!--  前一页  -->
				  	<c:if test="${sp.page==1 }">
				  		 <li><a href="javascript:void(0)" style="background-color: #ccc">&laquo;</a></li>
				  	</c:if>
				    <c:if test="${sp.page>1 }">
				   		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${sp.page-1 })">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${sp.pageStart }" end="${sp.pageEnd }" var="n">
				    	<c:if test="${sp.page==n }">
				    		<li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${n })" style="background-color: #ccc">${n }</a></li>
				    	</c:if>
				    	<c:if test="${sp.page!=n }">
				    		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${n })">${n }</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    <!--  后一页  -->
				    <c:if test="${sp.page==sp.maxPageNum }">
				  		 <li><a href="javascript:void(0)" style="background-color: #ccc">&raquo;</a></li>
				  	</c:if>
				    <c:if test="${sp.page<sp.maxPageNum }">
				   		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${sp.page+1 })">&raquo;</a></li>
				    </c:if>
				    
				    <c:if test="${sp.maxPageNum!=0 }">
				    	<li><a href="javascript:void(0)" id="cid">当前第${sp.page }页</a></li>
				   		<li><a href="javascript:void(0)">共${sp.maxPageNum }页</a></li>
				    </c:if>
				</ul>
					
		<!-- 查看用户详细信息的模态窗口 -->
		<div class="modal fade" id="detailUserModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看用户详情</h4>
					</div>
					<div class="modal-body" id="innerDetailUserModal"></div>
				</div>
			</div>
		</div>
		<!-- 修改用户信息的模态窗口 -->
		<div class="modal fade" id="editUserModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
					</div>
					<div class="modal-body" id="innerEditUserModal">
						
					</div>
					<div class="modal-footer">
						<button id="confirmEditUser" type="button" class="btn btn-success">确认修改</button>
						<button id="cancelEditUser" type="button" class="btn btn-default">取消</button>
					</div>
					<script type="text/javascript">
					$(document).ready(function(){
						//确认修改按钮
						$("#confirmEditUser").click(function(){
							$.post('user?op=edit',$('#editUserForm').serialize(),function(){
								$("#cancelEditUser").click();
								alertify.success("成功修改数据");
								submitForm();
							});
						});
						//取消按钮
						$("#cancelEditUser").click(function(){
							$(this).attr('data-dismiss','modal');
						});
					});
					</script>
				</div>
			</div>
		</div>

