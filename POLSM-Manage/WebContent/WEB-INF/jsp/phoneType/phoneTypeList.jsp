<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	//自动加载数据
	$(document).ready(function() {
		//提交表单
		submitForm();
	});

	//提交表单
	function submitForm() {
		$("#innerphoneTypeListdiv").load('phoneType?op=query',$("#phoneTypeListForm").serialize());
	};
	//查找手机类型信息
	$("#queryPhoneType").click(function() {
		submitForm();
	});
	//查找所有手机类型信息
	$("#queryAllPhoneTypes").click(function() {
		
		var searchForm = $("form")[0];
		searchForm.phoneTypeId.value = -1;
		searchForm.size.value = -1;
		searchForm.phoneTypeState.value = -1;
		searchForm.pixel.value= -1;
		searchForm.cpu.value= -1;
		submitForm();
	});
	//手机类型事件
	$("select[name='phoneTypeId']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//手机尺寸事件
	$("select[name='size']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//CPU核数事件
	$("select[name='cpu']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//上架状态事件
	$("select[name='phoneTypeState']").change(function() {
		var myForm = $("form")[0];
		myForm.pageStart.value = "";
		myForm.pageEnd.value = "";
		myForm.page.value = "";
		submitForm();
	});
	//手机像素事件
	$("select[name='pixel']").change(function() {
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
	//删除选中手机类型
	$("#deletePhoneTypes").click(function() {
		var cks = $("[name='ck']:checked");
		var names = "[";
		var ids = "";
		$(cks).each(function(index, item) {
			names += $(item).attr("ptname") + ",";
			ids += "id=" + $(item).val() + "&";
		});
		names += "]";
		ids = ids.substring(0, ids.length - 1);
		var message = "您确定要下架编号为[" + ids + "]的手机类型吗？";
		alertify.confirm(message, function(e) {
			if (e) {
				$("#innerphoneTypeListdiv").load("phoneType?op=delete&" + ids);
				alertify.success("成功下架");
			}
		});
	});
</script>
<div id="phoneTypeListdiv">
	<ol class="breadcrumb">
		<li class="active">商品管理</li>
		<li class="active">商品类型列表</li>
	</ol>
	<form class="form-horizontal" id="phoneTypeListForm">
		<!-- 隐藏表单域 -->
		<input type="hidden" name="pageStart" value="" /> 
		<input type="hidden" name="pageEnd" value="" /> 
		<input type="hidden" name="page" value="" />
		<table class="table" style="border: 0px; margin-top: -1%;">
			<tr>
				<td>
					<div class="input-group">
						<div class="input-group-addon">手机类型</div>
						<select name="phoneTypeId" class="form-control">
							<option value="-1">所有类型</option>
							<c:forEach items="${phoneTypeList }" var="phoneType">
								<option value="${phoneType.phoneTypeId }">${phoneType.phoneTypeName }</option>
							</c:forEach>
						</select>
					</div>
				</td>
				<td>
					<div class="input-group">
						<div class="input-group-addon">手机尺寸</div>
						<select name="size" class="form-control">
							<option value="-1">所有尺寸</option>
							<option value="4.0寸">4.0寸</option>
							<option value="4.7寸">4.7寸</option>
							<option value="5.0寸">5.0寸</option>
							<option value="5.0寸">5.1寸</option>
							<option value="5.5寸">5.5寸</option>
							<option value="5.5寸">5.9寸</option>
						</select>
					</div>
				</td>
				<td>
					<div class="input-group">
						<div class="input-group-addon">CPU核数</div>
						<select name="cpu" class="form-control">
							<option value="-1">所有</option>
							<option value="单核">单核</option>
							<option value="双核">双核</option>
							<option value="四核">四核</option>
							<option value="八核">八核</option>
							<option value="十核">十核</option>
						</select>
					</div>
				</td>
				<td>
					<div class="input-group">
						<div class="input-group-addon">上架状态</div>
						<select name="phoneTypeState" class="form-control">
							<option value="-1">全部</option>
							<option value="0" selected>上架中</option>
							<option value="1">已下架</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group">
						<div class="input-group-addon">手机像素</div>
						<select name="pixel" class="form-control">
							<option value="-1">所有</option>
							<option value="800万像素">800万像素</option>
							<option value="1200万像素">1200万像素</option>
							<option value="1300万像素">1300万像素</option>
							<option value="1600万像素">1600万像素</option>
						</select>
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

	<div class="btn-group" style="margin-left: 8px; margin-top: -30px">
		<button id="add" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#addPhoneType">立即添加</span>
		</button>
		<button id="queryPhoneType" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-search">立即查询</span>
		</button>
		<button id="queryAllPhoneTypes" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-search">查看全部</span>
		</button>
		<button id="deletePhoneTypes" class="btn btn-default" type="button">
			<span class="glyphicon glyphicon-remove">删除选中</span>
		</button>
	</div>

	<div id="innerphoneTypeListdiv"></div>
	
	</div>
	
	<!-- 添加商品类型的模式窗口 -->
	<div class="modal fade" id="addPhoneType" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog" style="width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加新商品类型</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addPhoneTypeForm">
						<div class="row">
							<div class="col-md-5">
								<label class="ui_button ui_button_primary" for="xFile"
									style="border: .1em solid #ccc; width: 100%; height: 50%; margin-top: .5em; text-align: center; line-height: 18em">点击上传手机图片</label>
								<input type="file" id="xFile"
									style="position: absolute; clip: rect(0, 0, 0, 0);">
								<div class="input-group" style="margin-top: .5em;">
									<div class="input-group-addon">手机网络</div>
									<input type="text" class="form-control" name="net" />
								</div>
								<div class="input-group" style="margin-top: .5em;">
									<div class="input-group-addon">手机均价</div>
									<input type="number" class="form-control" name="phoneTypePrice" />
								</div>
								<textarea class="form-control" name="phoneDesc"
									style="width: 100%; height: 40%; margin-top: .5em"
									placeholder="请输入手机详细信息" /></textarea>
							</div>
							<div class="col-md-7">
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">类型名称</div>
									<input type="text" class="form-control" name="phoneTypeName" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">上市时间</div>
									<input class="input_cxcalendar" class="form-control"
										name="phoneTypeTime" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">手机尺寸</div>
									<select class="form-control" name="size">
										<option value="4.0寸">4.0寸</option>
										<option value="4.7寸">4.7寸</option>
										<option value="5.0寸" selected>5.0寸</option>
										<option value="5.0寸">5.1寸</option>
										<option value="5.5寸">5.5寸</option>
										<option value="5.5寸">5.9寸</option>
									</select>
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">手机重量</div>
									<input type="text" class="form-control" name="weight" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">电池容量</div>
									<input type="text" class="form-control" name="callTime" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">待机时长</div>
									<input type="text" class="form-control" name="liveTime" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">CPU核数</div>
									<select class="form-control" name="cpu">
										<option value="单核">单核</option>
										<option value="双核">双核</option>
										<option value="四核" selected>四核</option>
										<option value="八核">八核</option>
										<option value="十核">十核</option>
									</select>
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">手机像素</div>
									<input type="text" class="form-control" name="pixel" />
								</div>
								<div class="input-group" style="margin: .5em;">
									<div class="input-group-addon">操作系统</div>
									<input type="text" class="form-control" name="system" />
								</div>
								<div class="input-group" style="margin: .5em; width: 95%">
									<button type="button" onclick="addPhoneType()"
										class="form-control btn btn-success">确认添加</button>
								</div>
								<div style="display: none">
									<input type="reset" id="clearPhoneTypeForm" />
								</div>
							</div>
						</div>
					</form>
					<script type="text/javascript">
						//时间插件
						$('.input_cxcalendar').each(function() {
							var a = new Calendar({
								targetCls : $(this),
								type : 'yyyy-mm-dd HH:MM:SS',
								wday : 2
							}, function(val) {
								console.log(val);
							});
						});
						//添加手机类型事件
						function addPhoneType() {
							var data = $("#addPhoneTypeForm").serialize();
							$("#maindiv").load("phoneType?op=add", data);
							$("#canPhoneType").click();
						}
						//取消按钮
						$(document).ready(function() {
							$("#canPhoneType").click(function() {
								//清空数据
								$("#clearPhoneTypeForm").click();
								//关闭模态窗口
								$(this).attr('data-dismiss', 'modal');
							});
						});
					</script>
				</div>
				<div class="modal-footer">
					<button id="canPhoneType" type="button" class="btn btn-default">取消</button>
				</div>
			</div>
		</div>
	</div>

