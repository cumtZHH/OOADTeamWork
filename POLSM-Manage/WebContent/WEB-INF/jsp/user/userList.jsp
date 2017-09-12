<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script type="text/javascript">
		//自动加载数据
		$(document).ready(function(){
			submitForm();
		});
		//提交表单
		function submitForm(){
			$("#innerUserListDiv").load('user?op=query',$("#userListForm").serialize());
		};
		//查找用户信息
		$("#queryUser").click(function(){
			submitForm();
		})
		//查找所有用户信息
		$("#queryUserAll").click(function(){
			var searchForm = $("form")[0];
			searchForm.userId.value="";
			searchForm.loginName.value="";
			searchForm.userName.value="";
			searchForm.tel.value="";
			searchForm.consume.value=-1;
			searchForm.userState.value=-1;
			searchForm.registerTimeStart.value="";
			searchForm.registerTimeEnd.value="";
			submitForm();
		});
		//用户消费额度事件
		$("select[name='consume']").change(function(){
				var myForm = $("form")[0];
				myForm.pageStart.value="";
				myForm.pageEnd.value="";
				myForm.page.value="";
				submitForm();
		});
		//用户状态事件
		$("select[name='userState']").change(function(){
				var myForm = $("form")[0];
				myForm.pageStart.value="";
				myForm.pageEnd.value="";
				myForm.page.value="";
				submitForm();
		});
		//分页机制的提交
		function page(pageStart,pageEnd,page){
			var myForm = $("form")[0];
			myForm.pageStart.value=pageStart;
			myForm.pageEnd.value=pageEnd;
			myForm.page.value=page;
			submitForm();
		};
		//全选按钮
		function ckAll(cka){
			$("[name=ck]").each(function(index,item){
				item.checked=cka.checked;
			});
		}
		//删除选中用户
		$("#deleteUsers").click(function(){
			var cks = $("[name='ck']:checked");
			var names = "[";
			var ids = "";
			$(cks).each(function(index,item){
				names +=$(item).attr("uname")+",";
				ids +="id="+$(item).val()+"&";
			});
			names +="]";
			ids = ids.substring(0,ids.length-1);
			var message = "您确定要删除名字为：["+names+"]的用户吗";
			alertify.confirm(message, function(e) {
				if (e) {
					$("#innerUserListDiv").load("user?op=delete&"+ids);
					alertify.success("成功下架");
				}
			}); 
		});
	</script>
		<div id="userListdiv">
			<ol class="breadcrumb">
			  <li class="active">会员管理</li>
			  <li class="active">会员列表</li>
			</ol>
			<form class="form-horizontal" id="userListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
			<table class="table" style="border:0px;margin-top: -1%;">
					<tr>
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">用户编号</div>
							      <input type="number" name="userId" class="form-control" />
							    </div>
						</td>
						
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">登录昵称</div>
							      <input type="text" name="loginName" class="form-control" />
							    </div>
						</td>
						
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">真实姓名</div>
							      <input type="text" name="userName" class="form-control" />
							    </div>
						</td>
						
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">手机号码</div>
							      <input type="number" name="tel" class="form-control" />
							    </div>
						</td>
					</tr>
					
					<tr >
						
						<td style="text-align: left">
							    <div class="input-group">
							      <div class="input-group-addon">消费额度</div>
							      <select name="consume" class="form-control">
									<option value="-1">不限额度</option>
									<option value="0-1000">1000以下</option>
									<option value="1000-3000">1000-3000</option>
									<option value="3000-5000">3000-5000</option>
									<option value="5000-10000">5000-10000</option>
									<option value="10000-99999">10000以上</option>
								 </select>
							    </div>
						</td>
						
						<td style="text-align: left">
							<div class="input-group">
							      <div class="input-group-addon">用户状态</div>
							     <select name="userState" class="form-control">
							     	<option value="-1">所有类型</option>
							     	<option value="0" selected>正常</option>
							     	<option value="1">限制登录</option>
								 </select>
							</div>
						</td>
						
						<td colspan="2" style="text-align: left">
						    <div class="input-group">
						       <div class="input-group-addon">注册时间</div>
						       <input class="input_cxcalendar" name="registerTimeStart" />-
						       <input class="input_cxcalendar" name="registerTimeEnd"/>
						    </div>
						</td>
						
					</tr>
				</table>

				 <script>
					$('.input_cxcalendar').each(function(){
						var a = new Calendar({
							targetCls: $(this),
							type: 'yyyy-mm-dd HH:MM:SS',
							wday:2
						},function(val){
							console.log(val);
						});
					});
				</script>
				
			</form>	
		
			<div class="btn-group" style="margin-left: 8px;margin-top: -30px">
					<button id="queryUser" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">立即查询</span>
					</button>
					<button id="queryUserAll" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">查看全部</span>
					</button>
					<button id="deleteUsers" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-remove">删除选中</span>
					</button>
			</div>
			<div id="innerUserListDiv"></div>
		</div>