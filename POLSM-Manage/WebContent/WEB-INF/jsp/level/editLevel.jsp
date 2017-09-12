<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div id="editLevelDiv">
		<form class="form-horizontal" id="editLevelForm" style="margin-left: 25%">
			  	<div class="input-group" style="width: 60%;margin: 4%;">
			      <div class="input-group-addon">等级编号</div>
			      <input type="text" class="form-control" value="${level.levelId }" name="levelId"/>
			    </div>
			   
			    <div class="input-group" style="width: 60%;margin: 4%;">
			      <div class="input-group-addon">等级名称</div>
			      <input type="text" class="form-control" value="${level.levelName }" name="levelName"/>
			    </div>
			    
			    <div class="input-group" style="width: 60%;margin: 4%;">
			      <div class="input-group-addon" >等级描述</div>
			      <input type="text" class="form-control" value="${level.levelDesc }" name="levelDesc"/>
			    </div>
			    
			    <div class="input-group" style="width: 60%;margin: 4%;">
			      <div class="input-group-addon" >会员折扣</div>
			      <input type="text" class="form-control" value="${level.discount }" name="discount"/>
			    </div>
			    
			    <div class="input-group" style="width: 60%;margin: 4%;">
			      <div class="input-group-addon" >等级状态</div>
			      <select class="form-control" name="levelState">
				      <c:if test="${level.levelState==0 }">
				      	<option value="0" selected>正常</option>
				      	<option value="1">已删除</option>
				      </c:if>
				      <c:if test="${level.levelState==1 }">
				      	<option value="0">正常</option>
				      	<option value="1" selected>已删除</option>
				      </c:if>
				  </select>
			    </div>
		</form>
	</div>