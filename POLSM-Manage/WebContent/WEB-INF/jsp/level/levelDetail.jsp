<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<div style="margin-left: 30%">
			  	<div class="input-group" style="width: 50%;margin: 10%;">
			      <div class="input-group-addon">等级编号</div>
			      <input type="text" class="form-control" value="${level.levelId }" readonly/>
			    </div>
			   
			    <div class="input-group" style="width: 50%;margin: 10%;">
			      <div class="input-group-addon">等级名称</div>
			      <input type="text" class="form-control" value="${level.levelName }" readonly/>
			    </div>
			    
			    <div class="input-group" style="width: 50%;margin: 10%;">
			      <div class="input-group-addon" >等级描述</div>
			      <input type="text" class="form-control" value="${level.levelDesc }" readonly/>
			    </div>
			    
			    <div class="input-group" style="width: 50%;margin: 10%;">
			      <div class="input-group-addon" >会员折扣</div>
			      <input type="text" class="form-control" value="${level.discount }" readonly/>
			    </div>
		    </div>
