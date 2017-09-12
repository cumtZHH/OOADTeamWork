<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<form class="form-horizontal" id="form" >
			<div class="row">
				<div class="col-md-6">
				  	<div><img src="${user.personPicture }" class="img-circle" style="width: 150px;height:150px;margin-left: 30%"/></div>
				    <div class="input-group" style="margin: 20px;">
				     	<div class="input-group-addon">用户编号</div>
		      			<input type="text" class="form-control" value="${user.userId }" readonly/>
				    </div>
				    <div class="input-group" style="margin: 20px;">
				      	<div class="input-group-addon">真实姓名</div>
		     			<input type="text" class="form-control" value="${user.userName }" readonly/>
				    </div>
				    
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >手机号码</div>
				      <input type="text" class="form-control" value="${user.tel }" readonly/>
				    </div>
				    
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >邮箱账号</div>
				      <input type="text" class="form-control" value="${user.email }" readonly/>
				    </div>
				    
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon">会员折扣</div>
				      <input type="text" class="form-control" value="${user.discount }" readonly/>
				    </div>
				    
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon">会员余额</div>
				      <input type="text" class="form-control" value="${user.money }" readonly/>
				    </div>
				    
				</div>
				
					<div class="col-md-6">
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon">登录昵称</div>
					      <input type="text" class="form-control" value="${user.loginName }" readonly/>
					    </div>
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon">性别</div>
					      <input type="text" class="form-control" value="${user.gender==0?'男':'女' }" readonly/>
					    </div>
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon" >密保问题</div>
					      <input type="text" class="form-control" value="${user.passQuestion }" readonly/>
					    </div>
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon" >密保答案</div>
					      <input type="text" class="form-control" value="${user.passAnswer }" readonly/>
					    </div>

						 <div class="input-group" style="margin: 20px;">
					     	 <div class="input-group-addon">等级名称</div>
		     				 <input type="text" class="form-control" value="${user.levelName }" readonly/>
					    </div>
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon">身份证件</div>
					      <input type="text" class="form-control" value="${user.IDCard }" readonly/>
					    </div>
					    
					    <div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon">累计消费</div>
					      <input type="text" class="form-control" value="${user.consume }" readonly/>
					    </div>
					    
					    <div class="input-group" style="margin: 20px;">
						   <div class="input-group-addon">登录状态</div>
						   <input type="text" class="form-control" value="${user.userState }" readonly/>
					    </div>
					    <div class="input-group" style="margin: 20px;">
					       <div class="input-group-addon">注册时间</div>
					       <input type="text" class="form-control" value="${user.registerTime }" readonly/>
						</div>
					    
					</div>
				</div>
			</form>
