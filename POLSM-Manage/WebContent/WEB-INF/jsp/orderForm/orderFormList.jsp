<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<script type="text/javascript">
		//自动加载数据
		$(document).ready(function(){
			//加载手机类型信息
			$.get("phoneType?op=addType&name=null", function(data) {
				$(data).each(function(index, item) {
					$("#types").append("<option value="+item.phoneTypeId+">"+item.phoneTypeName+"</option>");
				})
			});
			submitForm();
		});
		//提交表单
		function submitForm(){
			$("#innerOrderFormlListdiv").load('orderForm?op=query',$("#orderFormListForm").serialize());
		};
		//立即查询
		$("#queryOrderForm").click(function(){
			submitForm();
		});
		//查找所有订单信息
		$("#queryOrderForms").click(function(){
			var searchForm = $("#orderFormListForm")[0];
			searchForm.orderFormId.value="";
			searchForm.userName.value="";
			searchForm.phoneTypeId.value=-1;
			searchForm.phoneTypeName.value="";
			searchForm.orderStateDesc.value="";
			searchForm.orderStateTimeStart.value="";
			searchForm.orderStateTimeEnd.value="";
			submitForm();
		});
		//订单状态事件
		$("select[name='orderStateDesc']").change(function(){
			var myForm = $("form")[0];
			myForm.pageStart.value="";
			myForm.pageEnd.value="";
			myForm.page.value="";
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
	
	<div id="orderFormListDiv">
			<ol class="breadcrumb">
			  <li class="active">订单管理</li>
			  <li class="active">订单列表</li>
			</ol>	
			<form class="form-horizontal" id="orderFormListForm">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="pageStart" value=""/>
				<input type="hidden" name="pageEnd" value=""/>
				<input type="hidden" name="page" value=""/>
			<table class="table" style="border:0px;margin-top: -1%;">
					<tr>
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">订单编号</div>
							      <input type="text" class="form-control" name="orderFormId"/>
							    </div>
						</td>

						<td>
							    <div class="input-group">
							      <div class="input-group-addon">用户姓名</div>
							      <input type="text" class="form-control" name="userName"/>
							    </div>
						</td>
						
						<td style="text-align: left">
							<div class="input-group">
							      <div class="input-group-addon">手机类型</div>
							     <select id="types" name="phoneTypeId" class="form-control">
							     	<option value="-1">所有类型</option>
								 </select>
							</div>
						</td>
						
						<td>
							    <div class="input-group">
							      <div class="input-group-addon">商品关键字</div>
							      <input type="text" class="form-control" name="phoneTypeName"/>
							    </div>
						</td>
					</tr>
					
					<tr >
						
						<td style="text-align: left">
						    <div class="input-group">
						      <div class="input-group-addon">订单状态</div>
						      <select name="orderStateDesc" class="form-control">
								<option value="">全部</option>
								<option value="待付款">待付款</option>
								<option value="待发货">待发货</option>
								<option value="待收货">待收货</option>
								<option value="待评价">待评价</option>
								<option value="申请退款中">申请退款中</option>
								<option value="交易成功">交易成功</option>
							 </select>
						    </div>
						</td>
						
						
						<td colspan="2" style="text-align: left">
							    <div class="input-group">
							       <div class="input-group-addon">订单起始时间</div>
							       <input class="input_cxcalendar"  name="orderStateTimeStart"/>-<input class="input_cxcalendar" name="orderStateTimeEnd"/>
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
					<button id="queryOrderForm" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">立即查询</span>
					</button>
					<button id="queryOrderForms" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search">查看全部</span>
					</button>
			</div>
			
			<div id="innerOrderFormlListdiv"></div>	 
		</div>