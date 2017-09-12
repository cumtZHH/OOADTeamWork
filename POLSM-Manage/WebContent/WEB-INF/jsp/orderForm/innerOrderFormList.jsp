<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
	  	//查询订单详细信息
		function detailOrderForm(orderFormId){
			$("#innerDetailOrderFormModal").load("orderForm?op=queryById&orderFormId="+orderFormId);
		};
	 	 //编辑订单
		function editOrderForm(orderFormId){
			$("#innerEditOrderFormModal").load("orderForm?op=inputEdit&orderFormId="+orderFormId);
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
		<div style="height:285px;">
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th><input type="checkbox"  onclick="ckAll(this)"></th>
						<th>订单编号</th>
						<th>用户姓名</th>
						<th>商品名称</th>
						<th>订单类型</th>
						<th>订单时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="orderForm" varStatus="orderFormstatus">
						<c:forEach items="${orderForm.orderDetailList }" var="orderDetail" varStatus="orderDetailstatus">
							<c:if test="${orderFormstatus.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${orderFormstatus.index%2!=0 }">
								<tr class="info">
							</c:if>
								<c:if test="${orderDetailstatus.index==0 }">
									<td><input type="checkbox" name="ck" value="${orderForm.orderFormId }"></td>
									<td>${orderForm.orderFormId }</td>
									<td>${orderForm.user.userName }</td>
									<td>${orderDetail.phone.phoneTypeName }${orderDetail.phone.color }${orderDetail.phone.capacity }</td>
									<td>${orderForm.orderState.orderStateDesc }</td>
									
									<td>${orderForm.orderState.orderStateTime }</td>
									<td>
										<a data-toggle="modal" data-target="#detailOrderFormModal" onclick="detailOrderForm('${orderForm.orderFormId }')"  data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
										<a data-toggle="modal" data-target="#editOrderFormModal" onclick="editOrderForm('${orderForm.orderFormId }')"  data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									</td>
								</c:if>
								<c:if test="${orderDetailstatus.index>0 }">
									<td></td>
									<td></td>
									<td></td>
									<td>${orderDetail.phone.phoneTypeName }${orderDetail.phone.color }${orderDetail.phone.capacity }</td>
									<td></td>
									<td></td>
									<td></td>
								</c:if>
							</tr>
						</c:forEach>
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
 		
 		<!-- 查看订单详细信息的模态窗口 -->
		<div class="modal fade" id="detailOrderFormModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看订单详情</h4>
					</div>
					<div class="modal-body" id="innerDetailOrderFormModal"></div>
				</div>
			</div>
		</div>
		<!-- 修改订单详细信息的模态窗口 -->
		<div class="modal fade" id="editOrderFormModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改订单信息</h4>
					</div>
					<div class="modal-body" id="innerEditOrderFormModal">
						
					</div>
					<div class="modal-footer">
						<button id="confirmEditOrderForm" type="button" class="btn btn-success">确认修改</button>
						<button id="cancelEditOrderForm" type="button" class="btn btn-default">取消</button>
					</div>
					<script type="text/javascript">
					$(document).ready(function(){
						//确认修改按钮
						$("#confirmEditOrderForm").click(function(){
							$.post('orderForm?op=edit',$('#editOrderFormForm').serialize(),function(){
								$("#cancelEditOrderForm").click();
								alertify.success("成功修改数据");
								submitForm();
							});
						});
						//取消按钮
						$("#cancelEditOrderForm").click(function(){
							$(this).attr('data-dismiss','modal');
						});
					});
					</script>
				</div>
			</div>
		</div>
 		