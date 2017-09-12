<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<div id="editNewsDiv">
			<form class="form-horizontal" id="editNewsForm" >
				<div style="margin-left: 15%">
				  	<div class="input-group" style="width: 80%;margin: 4%;">
				      <div class="input-group-addon">公告编号</div>
				      <input type="text" class="form-control" value="${news.newsId }" name="newsId" readonly/>
				    </div>
				   
				    <div class="input-group" style="width: 80%;margin: 4%;">
				      <div class="input-group-addon">公告标题</div>
				      <input type="text" class="form-control" value="${news.title }" name="title"/>
				    </div>
				    
				    <div class="input-group" style="width: 80%;margin: 4%;">
				      <div class="input-group-addon" >公告时间</div>
				      <input class="input_cxcalendar form-control" value="${news.newsTime }" name="newsTime"/>
				    </div>
				    
				    <div class="input-group" style="width: 80%;margin: 4%;">
				      <div class="input-group-addon" >公告内容</div>
				      <textarea style="width: 410px;height: 100px;text-indent: 30px" name="newsContent">${news.newsContent }</textarea>
				    </div>
				    
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
					
				    <div class="input-group" style="width: 80%;margin: 4%;">
				      <div class="input-group-addon" >公告状态</div>
				      <select class="form-control" name="newsState">
					      <c:if test="${news.newsState==0 }">
					      		<option value="0" selected>已公布</option>
					      		<option value="1">未公布</option>
					      </c:if>
					      <c:if test="${news.newsState==1 }">
					      		<option value="0">已公布</option>
					      		<option value="1" selected>未公布</option>
					      </c:if>
				      </select>
				    </div>
				    
			    </div>
	    	</form>
    	</div>