<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script type="text/javascript">
		//自动加载数据
		$(document).ready(function() {
			//加载手机类型信息
			$.get("phoneType?op=addType&name=null", function(data) {
				$(data).each(function(index, item) {
					$("#types").append("<option value="+item.phoneTypeId+" name=phoneTypeId>"+ item.phoneTypeName+ "</option>");
				});
			});
			submitForm();
		});
		//提交表单
		function submitForm(){
			$("#innerCommentListDiv").load('comment?op=query',$("#commentListForm").serialize());
		};
		//立即查询事件
		$("#queryComment").click(function(){
			submitForm();
		})
		//查找所有评价信息
		$("#queryCommentAll").click(function(){
			var searchForm = $("form")[0];
			searchForm.userName.value="";
			searchForm.phoneTypeId.value=-1;
			searchForm.commentLevel.value=-1;
			searchForm.commentState.value=-1;
			searchForm.commentTimeStart.value="";
			searchForm.commentTimeEnd.value="";
			submitForm();
		});
		//手机类型事件
		$("select[name='phoneTypeId']").change(function(){
				var myForm = $("form")[0];
				myForm.pageStart.value="";
				myForm.pageEnd.value="";
				myForm.page.value="";
				submitForm();
		});
		//评价星数事件
		$("select[name='commentLevel']").change(function(){
				var myForm = $("form")[0];
				myForm.pageStart.value="";
				myForm.pageEnd.value="";
				myForm.page.value="";
				submitForm();
		});
		//评价状态事件
		$("select[name='commentState']").change(function(){
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
		//删除选中评价信息
		$("#deleteComments").click(function(){
			var cks = $("[name='ck']:checked");
			var ids = "";
			$(cks).each(function(index,item){
				ids +="id="+$(item).val()+"&";
			});
			ids = ids.substring(0,ids.length-1);
			var message = "您确定要删除编号为：["+ids+"]的评价信息吗";
			alertify.confirm(message, function(e) {
				if (e) {
					$("#innerCommentListDiv").load("comment?op=delete&"+ids);
					alertify.success("成功删除");
				}
			}); 
		});
	</script>
		<div id="commentListdiv">
			<ol class="breadcrumb">
			  <li class="active">营销管理</li>
			  <li class="active">评论列表</li>
			</ol>
			<form class="form-horizontal" id="commentListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
			<table class="table" style="border:0px;margin-top: -1%;">
					<tr>
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">用户姓名</div>
						      <input type="text" name="userName" class="form-control" />
						    </div>
						</td>

						<td>
							<div class="input-group">
							      <div class="input-group-addon">手机类型</div>
							     <select id="types" name="phoneTypeId" class="form-control">
							     	<option value="-1">所有类型</option>
								 </select>
							</div>
						</td>
						
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">评价星数</div>
							     <select name="commentLevel" class="form-control">
									<option value="-1">全部</option>
									<option value="五星">五星</option>
									<option value="四星">四星</option>
									<option value="三星">三星</option>
									<option value="二星">二星</option>
									<option value="一星">一星</option>
								 </select>
						    </div>
						</td>
						
						<td>
						    <div class="input-group">
						      <div class="input-group-addon">评价状态</div>
							     <select name="commentState" class="form-control">
									<option value="-1">全部</option>
									<option value="0" selected>存在</option>
									<option value="1">删除</option>
								 </select>
						    </div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: left">
						    <div class="input-group">
						       <div class="input-group-addon">评价时间</div>
						       <input class="input_cxcalendar" name="commentTimeStart" />-
						       <input class="input_cxcalendar" name="commentTimeEnd"/>
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
					<button id="queryComment" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">立即查询</span>
					</button>
					<button id="queryCommentAll" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">查看全部</span>
					</button>
					<button id="deleteComments" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-remove">删除选中</span>
					</button>
			</div>
			<div id="innerCommentListDiv"></div>
		</div>