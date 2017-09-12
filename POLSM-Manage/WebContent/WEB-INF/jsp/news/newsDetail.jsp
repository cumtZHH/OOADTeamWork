<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<div style="margin-left: 15%">
		  	<div class="input-group" style="width: 80%;margin: 5%;">
		      <div class="input-group-addon">公告编号</div>
		      <input type="text" class="form-control" value="${news.newsId }" readonly/>
		    </div>
		   
		    <div class="input-group" style="width: 80%;margin: 5%;">
		      <div class="input-group-addon">公告标题</div>
		      <input type="text" class="form-control" value="${news.title }" readonly/>
		    </div>
		    
		    <div class="input-group" style="width: 80%;margin: 5%;">
		      <div class="input-group-addon" >公告时间</div>
		      <input type="text" class="form-control" value="${news.newsTime }" readonly/>
		    </div>
		    
		    <div class="input-group" style="width: 80%;margin: 5%;">
		      <div class="input-group-addon" >公告状态</div>
		      <input type="text" class="form-control" value="${news.newsState==0?'已公布':'未公布' }" readonly/>
		    </div>
		    
		    <div class="input-group" style="width: 80%;margin: 5%;">
		      <div class="input-group-addon" >公告内容</div>
		      <textarea style="width: 410px;height: 100px;text-indent: 30px" readonly>${news.newsContent }</textarea>
		    </div>
	    </div>
    