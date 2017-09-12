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
			$("#innerLevelListDiv").load('level?op=query',$("#levelListForm").serialize());
		};
		//查找等级信息
		$("#queryLevel").click(function(){
			submitForm();
		})
		//查找所有等级信息
		$("#queryLevelAll").click(function(){
			var searchForm = $("form")[0];
			searchForm.levelId.value="";
			searchForm.levelState.value=-1;
			submitForm();
		});
		//等级状态事件
		$("select[name='levelState']").change(function(){
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
		//删除选中手机类型
		$("#deleteLevels").click(function(){
			var cks = $("[name='ck']:checked");
			var names = "[";
			var ids = "";
			$(cks).each(function(index,item){
				names +=$(item).attr("lname")+",";
				ids +="id="+$(item).val()+"&";
			});
			names +="]";
			ids = ids.substring(0,ids.length-1);
			var message = "您确定要下架编号为" + names + "的等级类型吗？";
			alertify.confirm(message, function(e) {
				if (e) {
					$("#innerLevelListDiv").load("level?op=delete&"+ids);
					alertify.success("成功删除");
				}
			});
		});
	</script>
		<div id="levelListdiv">
			<ol class="breadcrumb">
			  <li class="active">会员管理</li>
			  <li class="active">等级列表</li>
			</ol>	
			<form class="form-horizontal" id="levelListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
			<table class="table" style="border:0px;margin-top: -1%;width: 600px">
					<tr>
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">等级编号</div>
							      <input type="number" name="levelId" class="form-control" />
							    </div>
						</td>

						<td style="text-align: left">
							    <div class="input-group">
							      <div class="input-group-addon">等级状态</div>
							      <select name="levelState" class="form-control">
										<option value="-1">所有状态</option>
										<option value="0" selected>正常</option>
										<option value="1">已删除</option>
								 </select>
							    </div>
						</td>
						
					</tr>
				</table>
				
			</form>	
		
			<div class="btn-group" style="margin-left: 8px;margin-top: -30px">
					<button id="queryLevel" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">立即查询</span>
					</button>
					<button id="queryLevelAll" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">查看全部</span>
					</button>
					<button id="deleteLevels" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-remove">删除选中</span>
					</button>
			</div>
			<div id="innerLevelListDiv"></div>
		</div>