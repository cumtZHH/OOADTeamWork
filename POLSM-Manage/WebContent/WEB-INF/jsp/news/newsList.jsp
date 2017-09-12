<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rrz.polsm.pojo.Phone" %>
<%@ page import="com.rrz.polsm.pojo.PhoneType" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script type="text/javascript">
		//自动加载数据
		$(document).ready(function(){
			submitForm();
		});
		//提交表单
		function submitForm(){
			$("#innerNewsListDiv").load('news?op=query',$("#newsListForm").serialize());
		};
		//立即查询
		$("#query").click(function(){
			submitForm();
		});
		//查找所有公告
		$("#queryAll").click(function(){
			var searchForm = $("form")[0];
			searchForm.newsId.value="";
			searchForm.title.value="";
			searchForm.newsState.value=-1;
			searchForm.newsTimeStart.value="";
			searchForm.newsTimeEnd.value="";
			submitForm();
		});
		//公告状态事件
		$("select[name='newsState']").change(function(){
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
		//删除选中手公告
		$("#deleteNews").click(function(){
			var cks = $("[name='ck']:checked");
			var names = "[";
			var ids = "";
			$(cks).each(function(index,item){
				names +=$(item).attr("nname")+",";
				ids +="id="+$(item).val()+"&";
			});
			ids = ids.substring(0,ids.length-1);
			var message = "您确定要删除"+names+"的公告信息吗";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerNewsListDiv").load("news?op=delete&"+ids);
	            	alertify.success("成功更改数据");
	            }  
	        });
		});
	</script>
		<div id="newsListDiv">
			<ol class="breadcrumb">
			  <li class="active">营销管理</li>
			  <li class="active">公告信息</li>
			</ol>
			<form class="form-horizontal" id="newsListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
				
				<table class="table" style="border:0px;margin-top: -1%;width: 800px">
					<tr>
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">公告编号</div>
						      <input type="text" name="newsId" class="form-control"/>
						    </div>
						</td>
						
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">公告标题</div>
						      <input type="text" name="title" class="form-control"/>
						    </div>
						</td>
						
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">公告状态</div>
						      <select name="newsState" class="form-control">
									<option value="-1">所有</option>
									<option value="0" selected>已公布</option>
									<option value="1">未公布</option>
							 </select>
						    </div>
						</td>
					</tr>
					<tr>
					<td colspan="2" style="text-align: left">
					     <div class="input-group">
					       <div class="input-group-addon">公布时间</div>
					       <input class="input_cxcalendar" name="newsTimeStart" />-
					       <input class="input_cxcalendar" name="newsTimeEnd"/>
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
						<span class="glyphicon glyphicon-search">立即查询</span>
					</button>
					<button id="queryAll" class="btn btn-default" type="button">
						<span  class="glyphicon glyphicon-search">查看全部</span>
					</button>
					<button id="deleteNews" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-remove">删除选中</span>
					</button>
				</div>

			</form>
			
			<div id="innerNewsListDiv"></div>	 
		</div>
