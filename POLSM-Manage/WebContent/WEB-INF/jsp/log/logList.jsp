<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script type="text/javascript">
		//自动加载数据
		$(document).ready(function(){
			submitForm();
		});
		//提交表单
		function submitForm(){
			$("#innerLogListDiv").load('log',$("#logListForm").serialize());
		};
		//立即查询
		$("#query").click(function(){
			submitForm();
		});
		//查找所有公告
		$("#queryAll").click(function(){
			var searchForm = $("form")[0];
			searchForm.logId.value="";
			searchForm.message.value="";
			searchForm.logTimeStart.value="";
			searchForm.logTimeEnd.value="";
			submitForm();
		});
		//公告状态事件
		$("select[name='message']").change(function(){
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
	</script>
		<div id="newsListDiv">
			<ol class="breadcrumb">
			  <li class="active">系统管理</li>
			  <li class="active">查看日志</li>
			</ol>	
			<form class="form-horizontal" id="logListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
				
				<table class="table" style="border:0px;margin-top: -1%;">
					<tr>
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">日志编号</div>
						      <input type="text" name="logId" class="form-control"/>
						    </div>
						</td>
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">登录操作</div>
						      <select name="message" class="form-control">
									<option value="" selected>所有</option>
									<option value="登入系统">登入系统</option>
									<option value="退出系统">退出系统</option>
							 </select>
						    </div>
						</td>
						<td style="width: 600px">
						     <div class="input-group">
						       <div class="input-group-addon">登录时间</div>
						       <input class="input_cxcalendar" name="logTimeStart" />-
						       <input class="input_cxcalendar" name="logTimeEnd"/>
						    </div>
						</td>
					</tr>
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
				</table>
				
				<div class="btn-group" style="margin-left: 8px;margin-top: -30px">
					<button id="query" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">立即查询
					</button>
					<button id="queryAll" class="btn btn-default" type="button">
						<span  class="glyphicon glyphicon-search">查看全部
					</button>
				</div>

			</form>
			
			<div id="innerLogListDiv"></div>	 
		</div>