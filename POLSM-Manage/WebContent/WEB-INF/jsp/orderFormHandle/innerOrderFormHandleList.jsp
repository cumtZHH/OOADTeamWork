<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
	 	//一键发货
 		function deliver(orderFormId){
			var message = "您确定要给订单【"+orderFormId+"】发货吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerOrderFormHandleListdiv").load("orderFormHandle?op=deliver&orderFormId="+orderFormId);
	            	alertify.success("发货成功");
	            }  
	        });
		};
		//同意退款
		"confirmReturn('${orderForm.orderFormId }')"
		function confirmReturn(orderFormId){
			var message = "您确定同意订单【"+orderFormId+"】退款申请吗？";
			alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerOrderFormHandleListdiv").load("orderFormHandle?op=confirmReturn&orderFormId="+orderFormId);
	            	alertify.success("同意成功");
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
												<c:if test="${orderForm.orderState.orderStateDesc=='待发货' }">
													<button onclick="deliver('${orderForm.orderFormId }')" type="button" class="btn btn-info">一键发货</button>
												</c:if>
												<c:if test="${orderForm.orderState.orderStateDesc=='申请退款中' }">
													<button onclick="confirmReturn('${orderForm.orderFormId }')"  id="confirmReturn" type="button" class="btn btn-danger">同意退款</button>
												</c:if>
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
 