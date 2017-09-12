<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.rrz.polsm.pojo.Phone" %>
<%@ page import="java.util.List" %>
		<script>
		//查询手机类型详细信息
		function detailPhoneType(phoneTypeId){
			$("#innerDetailPhoneTypeModal").load("phoneType?op=queryById&phoneTypeId="+phoneTypeId);
		};
		//编辑手机类型
		function editPhoneType(phoneTypeId){
			$("#innerEditPhoneTypeModal").load("phoneType?op=inputEdit&phoneTypeId="+phoneTypeId);
		};
		//删除手机类型
		function deletePhoneType(phoneTypeName,phoneTypeId){
			var message = "您确定要下架[" + phoneTypeName + "]类型的手机吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerphoneTypeListdiv").load("phoneType?op=delete&phoneTypeId="+phoneTypeId);
	            	alertify.success("成功下架");
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
								<th><input type="checkbox" onclick="ckAll(this)"></th>
								<th>手机类型编号</th>
								<th>手机类型</th>
								<th>手机尺寸</th>
								<th>手机像素</th>
								<th>上市时间</th>
								<th>是否下架</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="phoneType" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" ptname="${phoneType.phoneTypeName }" value="${phoneType.phoneTypeId }"></td>
								<td>${phoneType.phoneTypeId }</td>
								<td>${phoneType.phoneTypeName }</td>
								<td>${phoneType.size }</td>
								<td>${phoneType.pixel }</td>
								<td>${phoneType.phoneTypeTime }</td>
								<td>${phoneType.phoneTypeState==0?'上架中':'已下架'  }</td>
								<td>
									<a data-toggle="modal" data-target="#detailPhoneTypeModal" onclick="detailPhoneType('${phoneType.phoneTypeId }')"  data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="modal" data-target="#editPhoneTypeModal" onclick="editPhoneType('${phoneType.phoneTypeId }')" data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									<a data-toggle="modal" onclick="deletePhoneType('${phoneType.phoneTypeName }',${phoneType.phoneTypeId })" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
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
				
					
		<!-- 查看商品类型详细信息的模态窗口 -->
		<div class="modal fade" id="detailPhoneTypeModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看手机类型详情</h4>
					</div>
					<div class="modal-body" id="innerDetailPhoneTypeModal"></div>
				</div>
			</div>
		</div>
		<!-- 修改商品类型详细信息的模态窗口 -->
		<div class="modal fade" id="editPhoneTypeModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改手机类型信息</h4>
					</div>
					<div class="modal-body" id="innerEditPhoneTypeModal">
						
					</div>
					<div class="modal-footer">
						<button id="confirmEditPhoneType" type="button" class="btn btn-success">确认修改</button>
						<button id="cancelEditPhoneType" type="button" class="btn btn-default">取消</button>
					</div>
					<script type="text/javascript">
					$(document).ready(function(){
						//确认修改按钮
						$("#confirmEditPhoneType").click(function(){
							$.post('phoneType?op=edit',$('#editPhoneTypeForm').serialize(),function(){
								$("#cancelEditPhoneType").click();
								alertify.success("成功修改数据");
								submitForm();
							});
						});
						//取消按钮
						$("#cancelEditPhoneType").click(function(){
							$(this).attr('data-dismiss','modal');
						});
					});
					</script>
				</div>
			</div>
		</div>
