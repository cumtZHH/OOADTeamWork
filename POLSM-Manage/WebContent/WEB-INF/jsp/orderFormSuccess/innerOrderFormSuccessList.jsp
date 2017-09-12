<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
    	//删除订单
    	function deleteOrderForm(){
    		var message = "您确定要删除此订单吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) {  
	            	//location.href = "manager?op=exit";  
	            }  
	        });
    	};
		//全选删除订单
		$("#deleteOrderForm").click(function(){
			var cks = $("[name='ck']:checked");
			var ids = "";
			$(cks).each(function(index,item){
				ids +="id="+$(item).val()+"&";
			});
			ids = ids.substring(0,ids.length-1);
			var message = "您确定要删除["+ids+"]订单吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) {  
	            	//location.href = "manager?op=exit";
	            }  
	        });
		});
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
												<a data-toggle="tooltip"  onclick="deleteOrderForm('${orderForm.orderFormId }')" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
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
 