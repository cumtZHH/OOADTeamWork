<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<form class="form-horizontal" id="editPhoneTypeForm" >
				<div class="row">
				  <div class="col-md-6">
				  	<div><img src="${phoneType.mainPicture }" style="width: 70%;margin-left: 15%"/></div>
				  	<div class="input-group" style="margin: 20px;">
					      <div class="input-group-addon" >CPU核数</div>
					      <input type="text" name="cpu" class="form-control" value="${phoneType.cpu }"/>
				    </div>
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >手机像素</div>
				      <input type="text" name="pixel" class="form-control" value="${phoneType.pixel }"/>
				    </div>
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >上市时间</div>
				      <input type="text" name="phoneTypeTime" class="form-control" value="${phoneType.phoneTypeTime }"/>
				    </div>
				    <div class="input-group" style="margin: 20px;">
				      <div class="input-group-addon" >手机均价</div>
				      <input type="text" name="phoneTypePrice" class="form-control" value="${phoneType.phoneTypePrice }"/>
				    </div>
				  </div>
				  
				  <div class="col-md-6">
			  		<div class="input-group"  style="margin: 10px;">
					      <div class="input-group-addon">类型编号</div>
					      <input type="text" name="phoneTypeId" class="form-control" value="${phoneType.phoneTypeId }" readonly/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon">类型名称</div>
					      <input type="text" name="phoneTypeName" class="form-control" value="${phoneType.phoneTypeName }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon">手机尺寸</div>
					      <select class="form-control" name="size">
						      	<option value="4.0寸">4.0寸</option>
						      	<option value="4.7寸" selected>4.7寸</option>
						      	<option value="5.0寸">5.0寸</option>
						      	<option value="5.1寸">5.1寸</option>
						      	<option value="5.5寸">5.5寸</option>
						      	<option value="5.9寸">5.9寸</option>
					      </select>
				    </div>
				    
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon">手机重量</div>
					      <input type="text" name="weight" class="form-control" value="${phoneType.weight }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon">电池容量</div>
					      <input type="text" name="callTime" class="form-control" value="${phoneType.callTime }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon" >待机时间</div>
					      <input type="text" name="liveTime" class="form-control" value="${phoneType.liveTime }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
					      <div class="input-group-addon" >手机网络</div>
					      <input type="text" name="net" class="form-control" value="${phoneType.net }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
				      <div class="input-group-addon" >操作系统</div>
				      <input type="text" name="system" class="form-control" value="${phoneType.system }"/>
				    </div>
				    <div class="input-group" style="margin: 10px;">
				     	 <div class="input-group-addon">下架状态</div>
				      <select class="form-control" name="phoneTypeState">
					      <c:if test="${phoneType.phoneTypeState==0 }">
					      	<option value="0" selected>上架中</option>
					      	<option value="1">已下架</option>
					      </c:if>
					      <c:if test="${phoneType.phoneTypeState==1 }">
					      	<option value="0">上架中</option>
					      	<option value="1" selected>已下架</option>
					      </c:if>
				      </select>
				   </div>
				</div>
			</div>
		</form>