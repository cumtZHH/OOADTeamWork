<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="row" >
			<table class="table table-hover table-condensed">
				<tr>
					<th colspan="10" style="background-color: #D9E1F7;text-align: left;">收获地址信息:</th>
				</tr>
				<tr>
					<th style="text-align: left;">收获人及联系方式:</th>
					<td  style="text-align: left;">
						${orderForm.address.receiverName }
						${orderForm.address.receiverTel }
					<td>
				</tr>
				<tr>
					<th style="text-align: left;">收获地址:</th>
					<td  style="text-align: left;">
						${orderForm.address.addressInfo }
					<td>
				</tr>
				<tr>
					<th style="text-align: left;">邮编信息:</th>
					<td  style="text-align: left;">
						${orderForm.address.postcode }
					<td>
				</tr>
				<tr>
					<th style="text-align: left;">运送方式:</th>
					<td  style="text-align: left;">快递</td>
				</tr>
				<tr>
					<th style="text-align: left;">买家备注:</th>
					<td  style="text-align: left;">${orderForm.remark }</td>
				</tr>
			</table>
			
			<table class="table table-hover table-condensed">
				<tr>
					<th colspan="10" style="background-color: #D9E1F7;text-align: left;">订单信息:</th>
				</tr>
				<tr>
					<th>订单编号:</th>
					<td  style="text-align: left;">
						${orderForm.orderFormId }
					<td>
					<c:forEach items="${orderForm.orderStateList }" var="orderStateList">
						<c:if test="${orderStateList.orderStateDesc=='待付款' }">
							<th>创建时间:</th>
							<td  style="text-align: left;">
								${orderStateList.orderStateTime }
							<td>
						</c:if>
						<c:if test="${orderStateList.orderStateDesc=='待发货' }">
							<th>付款时间:</th>
							<td  style="text-align: left;">
								${orderStateList.orderStateTime }
							<td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${orderForm.orderStateList }" var="orderStateList">
						<c:if test="${orderStateList.orderStateDesc=='待收获' }">
							<th>发货时间:</th>
							<td  style="text-align: left;">
								${orderStateList.orderStateTime }
							<td>
						</c:if>
						<c:if test="${orderStateList.orderStateDesc=='交易成功' }">
							<th>成交时间:</th>
							<td  style="text-align: left;">
								${orderStateList.orderStateTime }
							<td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>手机图片</th>
						<th>手机详情</th>
						<th>手机单价</th>
						<th>优惠情况</th>
						<th>实际付款</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${orderForm.orderDetailList }" var="orderDetail" varStatus="orderDetailstatus">
						<tr>
							<td><img src="${orderDetail.phone.picture }" style="width: 100px;height: 50px"/></td>
							<td>
								${orderDetail.phone.phoneTypeName }<br/>
								${orderDetail.phone.color }<br/>
								${orderDetail.phone.capacity }<br/>
							</td>
							<td>${orderDetail.phone.phonePrice }</td>
							<td>
								店内促销<br/>
								<del style="color:red">200</del>
							</td>
							<td>${orderDetail.phone.phonePrice-200 }</td>
						</tr>
				</c:forEach>
				<tr>
					<td colspan="10" style="text-align: right;">
						订单总价：<span style="color:red;font-size: 1.2em">￥${orderForm.orderFormPrice }</span>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
