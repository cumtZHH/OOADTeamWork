<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div id="editUserDiv">
		<form class="form-horizontal" id="editUserForm" >
			<div class="row">
				<div class="col-md-6">
				  	<div><img src="${user.personPicture }" class="img-circle" style="width: 150px;height:150px;margin-left: 30%"/></div>
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">用户编号</div>
				      <input type="text" class="form-control" value="${user.userId }" name="userId" readonly/>
				    </div>
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">真实姓名</div>
				      <input type="text" class="form-control" value="${user.userName }" name="userName"/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon" >手机号码</div>
				      <input type="text" class="form-control" value="${user.tel }" name="tel"/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon" >邮箱账号</div>
				      <input type="text" class="form-control" value="${user.email }" name="email"/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">会员余额</div>
				      <input type="text" class="form-control" value="${user.money }" name="money"/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">登录状态</div>
				      <select class="form-control" name="userState">
				      <c:if test="${user.userState==0 }">
				      	<option value="0" selected>可以登录</option>
				      	<option value="1">限制登录</option>
				      </c:if>
				      <c:if test="${user.userState!=0 }">
				      	<option value="0">可以登录</option>
				      	<option value="1" selected>限制登录</option>
				      </c:if>
				      </select>
				    </div>
				    
				    
				</div>
					
					<div class="col-md-6">
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">登录昵称</div>
				      <input type="text" class="form-control" value="${user.loginName }" name="loginName"/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">性别</div>
				      <select class="form-control" name="gender">
				      <c:if test="${user.gender==0 }">
				      	<option value="0" selected>男</option>
				      	<option value="1">女</option>
				      </c:if>
				      <c:if test="${user.gender!=0 }">
				      	<option value="0">男</option>
				      	<option value="1" selected>女</option>
				      </c:if>
				      </select>
				    </div>
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon" >密保问题</div>
				      <input type="text" class="form-control" value="${user.passQuestion }" name="passQuestion"/>
				    </div>
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon" >密保答案</div>
				      <input type="text" class="form-control" value="${user.passAnswer }" name="passAnswer"/>
				    </div>
				    
				    
					 <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">等级名称</div>
				      <select class="form-control" name="levelId">
				      	<c:forEach items="${levels }" var="level">
					      	<c:if test="${level.levelName==user.levelName }">
					      		<option value="${level.levelId }" selected>${level.levelName }</option>
					      	</c:if>
					      	<c:if test="${level.levelName!=user.levelName }">
					      		<option value="${level.levelId }">${level.levelName }</option>
					      	</c:if>
				      	</c:forEach>
				      </select>
				    </div>
				    <div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">身份证件</div>
				      <input type="text" class="form-control" value="${user.IDCard }" name="IDCard"/>
				    </div>
				    
			    	<div class="input-group" style="margin: 15px;">
				      <div class="input-group-addon">累计消费</div>
				      <input type="text" class="form-control" value="${user.consume }" readonly/>
				    </div>
				    
				    <div class="input-group" style="margin: 15px;">
				       <div class="input-group-addon">注册时间</div>
				       <input type="text" class="form-control" value="${user.registerTime }" readonly/>
					</div>
					
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >会员折扣</div>
				      <input type="text" class="form-control" value="${user.discount }" readonly/>
				    </div>
				    
					</div>
				</div>
			</form>
		</div>