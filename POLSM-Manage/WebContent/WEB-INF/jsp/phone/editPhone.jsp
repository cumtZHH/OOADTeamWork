<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<form class="form-horizontal" id="editPhoneForm" >
				<div class="row">
				  <div class="col-md-6">
				  	<div><img src="${phone.picture }" style="width: 100%"/></div>
				  	<textarea style="width: 303px;height: 50px" name="phoneDesc">${phone.phoneDesc }</textarea>
				  </div>
				  <div class="col-md-6">
			  		<div class="input-group" style="margin: 20px">
				      <div class="input-group-addon">手机编号</div>
				      <input type="text" class="form-control" name="phoneId" value="${phone.phoneId }" readonly/>
				    </div>
				    <div class="input-group" style="margin: 20px">
				   		 <div class="input-group-addon">手机类型</div>
					     <select name="phoneTypeId" class="form-control">
							<c:forEach items="${phoneTypeList }" var="phoneType">
								<c:choose>
									<c:when test="${phoneType.phoneTypeName==phone.phoneTypeName }">
										<option value="${phoneType.phoneTypeId }" selected>${phoneType.phoneTypeName }</option>
									</c:when>
									<c:otherwise>
										<option value="${phoneType.phoneTypeId }">${phoneType.phoneTypeName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
				    </div>
				    
				    <div class="input-group" style="margin: 20px">
				      <div class="input-group-addon">手机价格</div>
				      <input type="text" class="form-control" name="phonePrice" value="${phone.phonePrice }"/>
				    </div>
				    <div class="input-group" style="margin: 20px">
				      <div class="input-group-addon">手机颜色</div>
				      <input type="text" class="form-control" name="color" value="${phone.color }"/>
				    </div>
				    <div class="input-group" style="margin: 20px">
				      <div class="input-group-addon">手机容量</div>
				      <input type="text" class="form-control" name="capacity" value="${phone.capacity }"/>
				    </div>
				    <div class="input-group" style="margin: 20px">
				      <div class="input-group-addon">售卖状态</div>
				      <select class="form-control" name="phoneState">
				      <c:if test="${phone.phoneState==0 }">
				      	<option value="0" selected>未售卖</option>
				      	<option value="1">已售卖</option>
				      </c:if>
				      <c:if test="${phone.phoneState==1 }">
				      	<option value="0">未售卖</option>
				      	<option value="1" selected>已售卖</option>
				      </c:if>
				      </select>
					</div>
				</div>
			</div>
		</form>
