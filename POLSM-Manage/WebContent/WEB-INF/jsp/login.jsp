<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
引入bootstrap主题(可选的)
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" /> -->
<link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/userpanel.css">
<script src="bootstrap/js/jquery.min.js"></script>
<title>后台登陆</title>
<base href="${path }">
<!-- 表单验证 -->
	<script type="text/javascript">
		function doSubmit(){
			if($("#username").val()!=""&&$("#userpwd").val()!=""){
				if($("input[name=code]").val()!=""){
					var data = $("#loginForm").serialize();
					location.href="manager?op=login&data="+data;
				}else{
					$("#error").html('请输入验证码');
				}
			}else{
				$("#error").html('请输入完整的用户名和密码');
			}

		}
	</script>
</head>
<body>
	<form role="form" id="loginForm">
		<div class="login_m">
			<div class="login_logo">
				<h1>欢迎登陆艾玛三狼POLSM管理系统</h1>
			</div>
			<div class="login_boder">
				<div class="login_padding" id="login_model">
					<input type="hidden" name="uri" value="${uri }"></input>
					<div id="error" style="text-align: center; color: red">
						${loginError }</div>
					<h2>USERNAME</h2>
					<label> <input type="text" id="username" name="loginName"
						class="txt_input txt_input2"
						placeholder="Your Name">
					</label>
					<h2>PASSWORD</h2>
					<label> <input type="password" name="loginPass"
						id="userpwd" class="txt_input"
						placeholder="******">
					</label>
					<div>
						<input style="width:140px;height: 25px" name="code" type="text" placeholder="请输入验证码">
						<img src="code" style="background-color: #ccc;margin-left: 50px" onclick="this.src='code?x'+new Date().getTime();">
					</div>
					<div class="rem_sub">
						<div class="rem_sub_l">
							<input type="checkbox" name="checkbox" id="save_me"> <label
								for="checkbox">记住密码</label>
						</div>
						<label> 
						<input type="button" onclick="doSubmit()"  class="sub_button" name="button" id="button" value="登陆" style="opacity: 0.7;">
						</label>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>