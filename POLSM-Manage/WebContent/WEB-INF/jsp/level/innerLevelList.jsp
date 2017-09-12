<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
	<script>
		//查询等级信息
		function detailLevel(levelId){
			$("#innerDetailLevelModal").load("level?op=queryById&levelId="+levelId);
		};
		//编辑等级信息
		function editLevel(levelId){
			$("#innerEditLevelModal").load("level?op=inputEdit&levelId="+levelId);
		};
		//删除等级
		function deleteLevel(levelId,levelName){
			var message = "您确定删除["+levelName+"]等级的所有相关信息吗？";  
	        alertify.confirm(message, function (e) {  
	            if(e) { 
	            	$("#innerLevelList").load("level?op=delete&levelId="+levelId);
	            	alertify.success("成功删除");
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
								<th>等级编号</th>
								<th>等级名称</th>
								<th>会员折扣</th>
								<th>等级状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="level" varStatus="status">
							<c:if test="${status.index%2==0 }">
								<tr class="warning">
							</c:if>
							<c:if test="${status.index%2!=0 }">
								<tr class="info">
							</c:if>
								<td><input type="checkbox" name="ck" lname="${level.levelName }" value="${level.levelId }"></td>
								<td>${level.levelId }</td>
								<td>${level.levelName }</td>
								<td>${level.discount }</td>
								<td>${level.levelState==0?'正常状态':'已经删除' }</td>
								<td>
									<a data-toggle="modal" data-target="#detailLevelModal" onclick="detailLevel('${level.levelId }')"  data-placement="left" title="查看详情" class="glyphicon glyphicon-search"></a>
									<a data-toggle="modal" data-target="#editLevelModal" onclick="editLevel('${level.levelId }')" data-placement="left" title="编辑" class="glyphicon glyphicon-pencil"></a>
									<a data-toggle="tooltip" onclick="deleteLevel('${level.levelId }','${level.levelName }')" data-placement="left" title="删除" class="glyphicon glyphicon-remove"></a>
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
					
		<!-- 查看等级详细信息的模态窗口 -->
		<div class="modal fade" id="detailLevelModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查看等级详情</h4>
					</div>
					<div class="modal-body" id="innerDetailLevelModal"></div>
				</div>
			</div>
		</div>
		<!-- 修改等级类型信息的模态窗口 -->
		<div class="modal fade" id="editLevelModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog" style="width: 55%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改等级信息</h4>
					</div>
					<div class="modal-body" id="innerEditLevelModal">
						
					</div>
					<div class="modal-footer">
						<button id="confirmEditLevel" type="button" class="btn btn-success">确认修改</button>
						<button id="cancelEditLevel" type="button" class="btn btn-default">取消</button>
					</div>
					<script type="text/javascript">
					$(document).ready(function(){
						//确认修改按钮
						$("#confirmEditLevel").click(function(){
							$.post('level?op=edit',$('#editLevelForm').serialize(),function(){
								$("#cancelEditLevel").click();
								alertify.success("成功修改数据");
								submitForm();
							});
						});
						//取消按钮
						$("#cancelEditLevel").click(function(){
							$(this).attr('data-dismiss','modal');
						});
					});
					</script>
				</div>
			</div>
		</div>

