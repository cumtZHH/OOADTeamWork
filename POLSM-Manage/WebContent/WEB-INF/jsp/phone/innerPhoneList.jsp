<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.rrz.polsm.pojo.Phone" %>
<%@ page import="java.util.List" %>
	<script>
		//查询手机详细信息
		function detailPhone(phoneId) {
			$("#innerDetailPhoneModal").load("phone?op=queryById&phoneId=" + phoneId);
		};
		//编辑手机信息
		function editPhone(phoneId) {
			$("#innerEditPhoneModal").load("phone?op=inputEdit&phoneId=" + phoneId);
		};
		//删除手机信息
		function deletePhone(phoneId) {
			var message = "您确定删除编号为[" + phoneId + "]的手机吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerphoneListdiv").load("phone?op=delete&phoneId=" + phoneId);
	            	alertify.success("成功删除数据");
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
				<div style="height:337px;">
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th><input type="checkbox"  onclick="ckAll(this)"></th>
								<th>手机编号</th>
								<th>手机类型</th>
								<th>手机价格</th>
								<th>手机颜色</th>
								<th>手机容量</th>
								<th>售卖状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="phone" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" pname="${phone.phoneTypeName }" value="${phone.phoneId }"></td>
								<td>${phone.phoneId }</td>
								<td>${phone.phoneTypeName }</td>
								<td>${phone.phonePrice }</td>
								<td>${phone.color }</td>
								<td>${phone.capacity }</td>
								<td>${phone.phoneState==0?'未售出':'已售出'  }</td>
								<td>
									<a data-toggle="modal" data-target="#detailPhoneModal" onclick="detailPhone('${phone.phoneId }')" data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="modal" data-target="#editPhoneModal" onclick="editPhone('${phone.phoneId }')" data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									<a data-toggle="tooltip" onclick="deletePhone('${phone.phoneId }')" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
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

		<!-- 查看商品详细信息的模态窗口 -->
		<div class="modal fade" id="detailPhoneModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看手机详情</h4>
					</div>
					<div class="modal-body" id="innerDetailPhoneModal"></div>
				</div>
			</div>
		</div>
		<!-- 修改商品详细信息的模态窗口 -->
		<div class="modal fade" id="editPhoneModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改手机信息</h4>
					</div>
					<div class="modal-body" id="innerEditPhoneModal">
						
					</div>
					<div class="modal-footer">
						<button id="confirmEditPhone" type="button" class="btn btn-success">确认修改</button>
						<button id="cancelEditPhone" type="button" class="btn btn-default">取消</button>
					</div>
					<script type="text/javascript">
					$(document).ready(function(){
						//确认修改按钮
						$("#confirmEditPhone").click(function(){
							$.post('phone?op=edit',$('#editPhoneForm').serialize(),function(){
								$("#cancelEditPhone").click();
								alertify.success("成功修改数据");
								submitForm();
							});
						});
						//取消按钮
						$("#cancelEditPhone").click(function(){
							$(this).attr('data-dismiss','modal');
						});
					});
					</script>
				</div>
			</div>
		</div>
		
