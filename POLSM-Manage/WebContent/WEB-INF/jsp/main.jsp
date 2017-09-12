<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rrz.polsm.pojo.Phone"%>
<%@ page import="com.rrz.polsm.pojo.PhoneType"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<base href="${path }">
<head>
<meta charset="utf-8" />
<title>后台管理界面</title>
</head>
<!-- 引入基本的CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- 引入bootstrap主题(可选的) -->
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
<!-- 引入jquery 1.11.1  （务必在bootstrap.min.js之前引入） -->
<script src="bootstrap/js/jquery.min.js"></script>
<!-- 引入bootstrap.min.js文件 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- 引入日历样式 -->
<link href="css/cxcalendar.css" rel="stylesheet" />
<!-- 引入日历js -->
<script src="js/calendar.js"></script>
<!-- 引入alertify文件 -->
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" />
<script type="text/javascript" src="alertify.js-0.3.11/lib/alertify.min.js" ></script>
<script>
	$(document).ready(function() {
				//加载欢迎界面
				$("#maindiv").load("jsp?name=welcome");
				//改变颜色的JS
				$(".nav-pills li").click(function() {
					var newLi = this;
					var allLi = $(".nav-pills li");
					allLi.each(function(index, item) {
						if (item == newLi)
							$(newLi).addClass("active");
						else
							$(item).removeClass("active");
					});
				});
				runtime();
				//商品列表事件
				$("#phoneList").click(function() {
					$("#maindiv").load('phoneType','op=addType&name=phone/phoneList');
				});
				//商品类型列表事件
				$("#phoneTypeList").click(
					function() {
						$("#maindiv").load('phoneType','op=addType&name=phoneType/phoneTypeList');
					});
				//订单详细列表事件
				$("#orderDetailList").click(function() {
					$("#maindiv").load('jsp?name=orderForm/orderFormList');
				});
				//待处理订单事件
				$("#orderFormHandleList").click(function() {
					$("#maindiv").load('jsp?name=orderFormHandle/orderFormHandleList');
				});
				//成功订单事件
				$("#orderFormSuccessList").click(function() {
					$("#maindiv").load('jsp?name=orderFormSuccess/orderFormSuccessList');
				});
				//会员列表事件
				$("#userList").click(function() {
					$("#maindiv").load('jsp?name=user/userList');
				});
				//等级列表事件
				$("#levelList").click(function() {
					$("#maindiv").load('level?op=addType&name=level/levelList');
				});
				//公告信息事件
				$("#newsList").click(function() {
					$("#maindiv").load('jsp?name=news/newsList');
				});
				//商品评论事件
				$("#commentList").click(function() {
					$("#maindiv").load('jsp?name=comment/commentList');
				});
				//日志事件
				$("#logList").click(function() {
					$("#maindiv").load("jsp?name=log/logList");
				});
				//退出事件
				$(".exit").click(function() {
					var message = "您确定退出系统吗？";  
			        alertify.confirm(message, function (e) {  
			            if(e) {  
			            	location.href = "manager?op=exit";
			            }  
			        }); 
				});
			})
</script>
<script type="text/javascript">
	//获得时间
	function runtime() {
		var date = new Date();
		var day = undefined;
		console.log(date.getDay());
		switch (date.getDay()) {
		case 1:
			day = "一";
			break;
		case 2:
			day = "二";
			break;
		case 3:
			day = "三";
			break;
		case 4:
			day = "四";
			break;
		case 5:
			day = "五";
			break;
		case 6:
			day = "六";
			break;
		case 0:
			day = "日";
			break;
		}
		var str = date.getFullYear()
				+ "年"
				+ (date.getMonth() + 1)
				+ "月"
				+ date.getDate()
				+ "日"
				+ "   "
				+ date.getHours()
				+ ":"
				+ ((date.getMinutes() + "").length == 1 ? 0 + ""
						+ date.getMinutes() : date.getMinutes())
				+ ":"
				+ ((date.getSeconds() + "").length == 1 ? 0 + ""
						+ date.getSeconds() : date.getSeconds()) + "    星期"
				+ day;
		console.log($("#spantime"));
		$("#spantime").html(str);
		$("#spantime").innerHTML = str;
		setTimeout('runtime()', 1000);
	}
</script>
<body>
	<div class="container-fluid" style="height: 100%">
		<!--第一栏：标题-->
		<div class="row" style="background-color: #ccc; height: 15%;">
			<div class="col-xs-4">
				<h2>
					艾玛三<img src="images/logo.jpg" style="width: 1.5em; height: 1.5em;" />手机后台管理界面
				</h2>
				<span style="font-family: 黑体; font-size: 1em; color: red;">尊敬的用户,欢迎您:${managerMessage.loginName }
				</span>
			</div>
			<div class="col-xs-6" style="margin-top: 1.6em">
				<ul class="nav nav-pills" role="tablist">
					<li class="active" style="font-size: 1.5em"><a
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" style="color: black">商品管理</a></li>
					<li style="font-size: 1.5em"><a data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" style="color: black">订单管理</a>
					</li>
					<li style="font-size: 1.5em"><a data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						style="color: black">会员管理</a></li>
					<li style="font-size: 1.5em"><a data-toggle="collapse"
						data-parent="#accordion" href="#collapseFour" style="color: black">促销管理</a>
					</li>
					<li style="font-size: 1.5em"><a data-toggle="collapse"
						data-parent="#accordion" href="#collapseFive" style="color: black">系统管理</a>
					</li>
				</ul>
			</div>
			<div class="col-ms-2" style="text-align: center">
				<div style="margin-top: 1.2em;">
					<a href="javascript:void(0)" class="exit"
						style="margin: .3em; color: black;">注销登录</a> <a
						href="javascript:void(0)" onclick="help()" style="color: black">帮助中心</a>
				</div>
				<div style="margin-top: 1em;">
					<span style="font-family: 黑体; font-size: 0.9em; color: red;"
						id="spantime">时间</span>
				</div>
			</div>
		</div>
		<!--第二栏：功能列表-->
		<div class="row" style="height: 79%;">
			<div class="col-xs-2" style="height: 100%; padding: 0em; background-color: #ACCCF5;">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div style="padding: 0em; margin: 0em;" class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" class="btn btn-info"
										style="text-align: center; line-height: 1.6em; width: 100%; height: 2.8em; display: block;"
										data-parent="#accordion" href="#collapseOne"> 商品管理 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse ">
								<div class="panel-body" style="background-color: #ccc;">
									<ul class="nav nav-pills" role="tablist">
										<li style="width: 100%"><a id="phoneList"
											href="javascript:void(0)">商品列表</a></li>
										<li style="width: 100%"><a id="phoneTypeList"
											href="javascript:void(0)">商品类型列表</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div style="padding: 0em; margin: 0em;" class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" class="btn btn-info"
										style="text-align: center; line-height: 1.6em; width: 100%; height: 2.8em; display: block;"
										data-parent="#accordion" href="#collapseTwo"> 订单管理 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ccc;">
									<ul class="nav nav-pills" role="tablist">
										<li style="width: 100%"><a id="orderDetailList" href="javascript:void(0)">订单列表</a></li>
										<li style="width: 100%"><a id="orderFormHandleList" href="javascript:void(0)">待处理订单</a></li>
										<li style="width: 100%"><a id="orderFormSuccessList" href="javascript:void(0)">交易完成订单</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div style="padding: 0em; margin: 0em;" class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" class="btn btn-info"
										style="text-align: center; line-height: 1.6em; width: 100%; height: 2.8em; display: block;"
										data-parent="#accordion" href="#collapseThree"> 会员管理 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ccc;">
									<ul class="nav nav-pills" role="tablist">
										<li style="width: 100%"><a id="userList"
											href="javascript:void(0)">会员列表</a></li>
										<li style="width: 100%"><a id="levelList"
											href="javascript:void(0)">等级列表</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div style="padding: 0em; margin: 0em;" class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" class="btn btn-info"
										style="text-align: center; line-height: 1.6em; width: 100%; height: 2.8em; display: block;"
										data-parent="#accordion" href="#collapseFour"> 营销管理 </a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ccc;">
									<ul class="nav nav-pills" role="tablist">
										<li style="width: 100%"><a id="newsList" href="javascript:void(0)">公告信息</a></li>
										<li style="width: 100%"><a id="commentList" href="javascript:void(0)">评价列表</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div style="padding: 0em; margin: 0em;" class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" class="btn btn-info"
										style="text-align: center; line-height: 1.6em; width: 100%; height: 2.8em; display: block;"
										data-parent="#accordion" href="#collapseFive"> 系统管理 </a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ccc;">
									<ul class="nav nav-pills" role="tablist">
										<li style="width: 100%"><a id="logList"
											href="javascript:void(0)">查看日志</a></li>
										<li style="width: 100%"><a href="javascript:void(0)">重置密码</a></li>
										<li style="width: 100%"><a class="exit"
											href="javascript:void(0)">安全退出</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-10" id="maindiv" style="height: 100%; width: 83%; padding: 0em; border: .1em solid #ccc;">
				</div>
			</div>
		<!--第三栏-->
		<div class="row-fluid"
			style="background-color: #FFF; height: 4%; text-align: center;">
			<h6>&copy;安徽合肥艾玛三狼有限责任公司</h6>
		</div>
	</div>
</body>
</html>