<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
	
	<script>
		//查询公告详细信息
		function detailNews(newsId){
			$("#innerDetailNewsModal").load("news?op=queryById&newsId="+newsId);
		};
		//编辑公告信息
		function editNews(newsId){
			$("#innerEditNewsModal").load("news?op=inputEdit&newsId="+newsId);
		};
		//删除公告信息
		function deleteNews(newsId,newsTitle){
			var message = "您确定删除["+newsTitle+"]的公告吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerNewsListDiv").load("news?op=delete&newsId="+newsId);
	            	alertify.success("删除成功");
	            }  
	        });
		};
	</script>
	<style>
    	#table th{
    		text-align: center;
    	}
    	#table td{
    		text-align: center;
    	}
    </style>
				<div style="height:292px;">
					<table class="table table-bordered table-hover table-condensed" id="table">
						<thead>
							<tr>
								<th><input type="checkbox"  onclick="ckAll(this)"></th>
								<th>公告编号</th>
								<th>公告标题</th>
								<th>发布时间</th>
								<th>发布状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="news" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" nname="${news.title }" value="${news.newsId }"></td>
								<td>${news.newsId }</td>
								<td>${news.title }</td>
								<td>${news.newsTime }</td>
								<td>${news.newsState==0?'已经发布':'尚未发布' }</td>
								<td>
									<a data-toggle="modal" data-target="#detailNewsModal" onclick="detailNews('${news.newsId }')"  data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="modal" data-target="#editNewsModal" onclick="editNews('${news.newsId }')" data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									<a data-toggle="tooltip"  onclick="deleteNews('${news.newsId }','${news.title }')" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<ul class="pagination">
				  	<!--  前一页  -->
				  	<c:if test="${sp.page==1 }">
				  		 <li><a href="javascript:void(0)" style="background-color: #ccc">&laquo;</a></li>
				  	</c:if>
				    <c:if test="${sp.page>1 }">
				   		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${sp.page-1 })">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${sp.pageStart }" end="${sp.pageEnd }" var="n">
				    	<c:if test="${sp.page==n }">
				    		<li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${n })" style="background-color: #ccc">${n }</a></li>
				    	</c:if>
				    	<c:if test="${sp.page!=n }">
				    		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${n })">${n }</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    <!--  后一页  -->
				    <c:if test="${sp.page==sp.maxPageNum }">
				  		 <li><a href="javascript:void(0)" style="background-color: #ccc">&raquo;</a></li>
				  	</c:if>
				    <c:if test="${sp.page<sp.maxPageNum }">
				   		 <li><a href="javascript:page(${sp.pageStart },${sp.pageEnd },${sp.page+1 })">&raquo;</a></li>
				    </c:if>
				    
				    <c:if test="${sp.maxPageNum!=0 }">
				    	<li><a href="javascript:void(0)" id="cid">当前第${sp.page }页</a></li>
				   		<li><a href="javascript:void(0)">共${sp.maxPageNum }页</a></li>
				    </c:if>
				</ul>
		
				<!-- 查看公告详细信息的模态窗口 -->
				<div class="modal fade" id="detailNewsModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="static">
					<div class="modal-dialog" style="width: 55%">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">查看公告详情</h4>
							</div>
							<div class="modal-body" id="innerDetailNewsModal"></div>
						</div>
					</div>
				</div>
				<!-- 修改公告信息的模态窗口 -->
				<div class="modal fade" id="editNewsModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="static">
					<div class="modal-dialog" style="width: 55%">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">修改公告信息</h4>
							</div>
							<div class="modal-body" id="innerEditNewsModal">
								
							</div>
							<div class="modal-footer">
								<button id="confirmEditNews" type="button" class="btn btn-success">确认修改</button>
								<button id="cancelEditNews" type="button" class="btn btn-default">取消</button>
							</div>
							<script type="text/javascript">
							$(document).ready(function(){
								//确认修改按钮
								$("#confirmEditNews").click(function(){
									$.post('news?op=edit',$('#editNewsForm').serialize(),function(){
										$("#cancelEditNews").click();
										alertify.success("成功修改公告");
										submitForm();
									});
								});
								//取消按钮
								$("#cancelEditNews").click(function(){
									$(this).attr('data-dismiss','modal');
								});
							});
							</script>
						</div>
					</div>
				</div>
