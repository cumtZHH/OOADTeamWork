<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<script>
		//查询评价信息
		function detailComment(commentId){
			$("#innerDetailCommentModal").load("comment",'op=queryById&commentId='+commentId);
		};
		//删除评价信息
		function deleteComment(commentId){
			var message = "您确定删除评论编号为["+commentId+"]的评价信息吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerCommentListDiv").load("comment",'op=delete&commentId='+commentId);
	            	alertify.success("删除成功");
	            }  
	        });
		};
	</script>
	<style>
    	th{
    		text-align: center;
    	}
    	td{
    		text-align: center;
    	}
    </style>
    			<div style="height:290px;">
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th><input type="checkbox"  onclick="ckAll(this)"></th>
								<th>评论编号</th>
								<th>用户姓名</th>
								<th>手机类型</th>
								<th>评价星数</th>
								<th>评价时间</th>
								<th>评价状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="comment" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" value="${comment.commentId }"></td>
								<td>${comment.commentId }</td>
								<td>${comment.userName }</td>
								<td>${comment.phone.phoneTypeName }</td>
								<td>${comment.commentLevel }</td>
								<td>${comment.commentTime }</td>
								<td>${comment.commentState==0?'存在':'删除' }</td>
								<td>
									<a data-toggle="modal" data-target="#detailCommentModal" onclick="detailComment('${comment.commentId }')" data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="tooltip" onclick="deleteComment('${comment.commentId }')" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
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
					
		<!-- 查看评价表的模态窗口 -->
		<div class="modal fade" id="detailCommentModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看商品评价详情</h4>
					</div>
					<div class="modal-body" id="innerDetailCommentModal"></div>
				</div>
			</div>
		</div>

