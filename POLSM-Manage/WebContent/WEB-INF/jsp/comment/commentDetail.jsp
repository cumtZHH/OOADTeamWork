<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			<div style="margin-left: 15%">
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon">评价编号</div>
			      <input type="text" class="form-control" value="${comment.commentId }" readonly/>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon">评价用户</div>
			      <input type="text" class="form-control" value="${comment.userName }" readonly/>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon">手机编号</div>
			      <input type="text" class="form-control" value="${comment.phone.phoneTypeName }" readonly/>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon" >手机详情</div>
			      <input type="text" class="form-control" value="手机容量:${comment.phone.capacity }&nbsp&nbsp&nbsp手机颜色:${comment.phone.color }" readonly/>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon" >评价星数</div>
			      <input type="text" class="form-control" value="${comment.commentLevel }" readonly/>
			    </div>
				<div class="input-group" style="width: 80%;margin: 3%;">
			     	 <div class="input-group-addon">评价时间</div>
     				 <input type="text" class="form-control" value="${comment.commentTime }" readonly/>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon" >公告内容</div>
			      <textarea style="width: 410px;height: 50px" name="newsContent" readonly>${comment.commentContent }</textarea>
			    </div>
			    <div class="input-group" style="width: 80%;margin: 3%;">
			      <div class="input-group-addon">评价状态</div>
			      <input type="text" class="form-control" value="${comment.commentState==0?'存在':'删除' }" readonly/>
			    </div>
			</div>
