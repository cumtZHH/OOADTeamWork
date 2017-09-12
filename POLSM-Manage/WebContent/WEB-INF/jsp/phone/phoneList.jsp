<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rrz.polsm.pojo.Phone"%>
<%@ page import="com.rrz.polsm.pojo.PhoneType"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	//自动加载数据
	$(document).ready(function() {
		submitForm();
	});
	//提交表单
	function submitForm() {
		$("#innerphoneListdiv").load('phone?op=query', $("#form").serialize());
	};
	//立即查询
	$("#query").click(function() {
		submitForm();
	});
	//查找所有手机
	$("#queryAll").click(function() {
		var searchForm = $("form")[0];
		searchForm.type.value = -1;
		searchForm.price.value = -1;
		searchForm.phoneState.value = -1;
		searchForm.phoneId.value = "";
		submitForm();
	});
	//手机类型事件
	$("select[name='type']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//手机价格事件
	$("select[name='price']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//售卖状态事件
	$("select[name='phoneState']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//分页机制的提交
	function page(pageStart, pageEnd, page) {
		var myForm = $("form")[0];
		myForm.pageStart.value = pageStart;
		myForm.pageEnd.value = pageEnd;
		myForm.page.value = page;
		submitForm();
	};
	//全选按钮
	function ckAll(cka) {
		$("[name=ck]").each(function(index, item) {
			item.checked = cka.checked;
		});
	}
	//删除选中手机
	$("#deletePhone").click(function() {
		var cks = $("[name='ck']:checked");
		var ids = "";
		$(cks).each(function(index, item) {
			ids += "id=" + $(item).val() + "&";
		});
		ids = ids.substring(0, ids.length - 1);
		var message = "您确定要更改编号为[" + ids + "]的手机状态信息吗？";  
        alertify.confirm(message, function (e) {  
            if(e) { 
            	$("#innerphoneListdiv").load("phone?op=delete&" + ids);
            	alertify.success("成功更改数据");
            }  
        });
	});
</script>
<div id="phoneListdiv">
	<ol class="breadcrumb">
		<li class="active">商品管理</li>
		<li class="active">商品列表</li>
	</ol>

	<form class="form-horizontal" id="form">
		<!-- 隐藏表单域 -->
		<input type="hidden" name="pageStart" value="" /> <input type="hidden"
			name="pageEnd" value="" /> <input type="hidden" name="page" value="" />

		<table class="table" style="border: 0px; margin-top: -1%;">
			<tr>

				<td>
					<div class="input-group">
						<div class="input-group-addon">手机编号</div>
						<input type="number" name="phoneId" class="form-control" />
					</div>
				</td>

				<td>
					<div class="input-group">
						<div class="input-group-addon">手机类型</div>
						<select name="type" class="form-control">
							<option value="-1">所有类型</option>
							<c:forEach items="${phoneTypeList }" var="phoneType">
								<option value="${phoneType.phoneTypeName }">${phoneType.phoneTypeName }</option>
							</c:forEach>
						</select>
					</div>
				</td>

				<td>
					<div class="input-group">
						<div class="input-group-addon">价格区间</div>
						<select name="price" class="form-control">
							<option value="-1">不限价格</option>
							<option value="1">1000以下</option>
							<option value="2">1000-1500</option>
							<option value="3">1500-3000</option>
							<option value="4">3000-5000</option>
							<option value="5">5000以上</option>
						</select>
					</div>
				</td>

				<td>
					<div class="input-group">
						<div class="input-group-addon">售卖状态</div>
						<select name="phoneState" class="form-control">
							<option value="-1">全部</option>
							<option value="0" selected>未售</option>
							<option value="1">已售</option>
						</select>
					</div>
				</td>


			</tr>

		</table>

	</form>
	<div class="btn-group" style="margin-left: 8px; margin-top: -30px">
		<button id="add" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#addPhone">添加商品 </span>
		</button>
		<button id="query" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-search">立即查询  </span>
		</button>
		<button id="queryAll" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-search">查看全部  </span>
		</button>
		<button id="deletePhone" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-remove">删除选中  </span>
		</button>
	</div>

	<div id="innerphoneListdiv"></div>
	<!-- 添加商品的模式窗口 -->
	<div class="modal fade" id="addPhone" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog" style="width: 55%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加新商品</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addPhoneForm">
						<div class="row" style="margin-left: 5%">
							<div class="col-md-4">
								<label class="ui_button ui_button_primary" for="xFile"
									style="border: .1em solid #ccc; width: 100%; height: 60%; margin-top: 2em; text-align: center; line-height: 18em">点击上传手机图片</label>
								<input type="file" id="xFile"
									style="position: absolute; clip: rect(0, 0, 0, 0);">
								<textarea class="form-control" name="phoneDesc"
									style="width: 100%; height: 40%" placeholder="请输入手机详细信息" /></textarea>
							</div>
							<div class="col-md-8">
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<div class="input-group-addon">手机类型</div>
									<select id="mainPhoneTypes" name="phoneTypeId"
										class="form-control">
									</select>
								</div>
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<div class="input-group-addon">手机价格</div>
									<input type="number" class="form-control" name="phonePrice" />
								</div>
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<div class="input-group-addon">手机颜色</div>
									<input type="text" class="form-control" name="color" />
								</div>
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<div class="input-group-addon">手机容量</div>
									<input type="text" class="form-control" name="capacity" />
								</div>
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<div class="input-group-addon">添加数量</div>
									<input type="text" class="form-control" name="num" />
								</div>
								<div class="input-group" style="width: 75%; margin: 1.5em;">
									<button type="button" onclick="addPhone()"
										class="form-control btn btn-success">确认添加</button>
								</div>
								<div style="display: none">
									<input type="reset" id="clearPhoneForm"/>
								</div>
							</div>
						</div>
					</form>
					<script type="text/javascript">
						//添加手机事件
						function addPhone() {
							var data = $("#addPhoneForm").serialize();
							$("#maindiv").load("phone?op=add", data);
							$("#canPhone").click();
						}
						//取消按钮
						$(document).ready(function(){
							$("#canPhone").click(function(){
								//清空数据
								$("#clearPhoneForm").click();
								//关闭模态窗口
								$(this).attr('data-dismiss','modal');
							});
						});
					</script>
				</div>
				<div class="modal-footer">
					<button id="canPhone" type="button" class="btn btn-default">取消</button>
				</div>
			</div>
		</div>
	</div>
	

</div>
