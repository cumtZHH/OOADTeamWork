<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="row">
			<div class="col-md-6">
			  	<div><img src="${phoneType.mainPicture }" style="width: 70%;margin-left: 15%"/></div>
			  	<div class="input-group" style="margin: 20px;">
			      <div class="input-group-addon" >CPU核数</div>
			      <input type="text" class="form-control" value="${phoneType.system }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 20px;">
			      <div class="input-group-addon" >手机像素</div>
			      <input type="text" class="form-control" value="${phoneType.pixel }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 20px;">
			      <div class="input-group-addon" >上市时间</div>
			      <input type="text" class="form-control" value="${phoneType.phoneTypeTime }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 20px;">
			      <div class="input-group-addon" >手机均价</div>
			      <input type="text" class="form-control" value="${phoneType.phoneTypePrice }" readonly/>
			    </div>
		    </div>
		  <div class="col-md-6">
		  		<div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">类型编号</div>
			      <input type="text" class="form-control" value="${phoneType.phoneTypeId }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">类型名称</div>
			      <input type="text" class="form-control" value="${phoneType.phoneTypeName }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">手机尺寸</div>
			      <input type="text" class="form-control" value="${phoneType.size }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">手机重量</div>
			      <input type="text" class="form-control" value="${phoneType.weight }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">电池容量</div>
			      <input type="text" class="form-control" value="${phoneType.callTime }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon" >待机时间</div>
			      <input type="text" class="form-control" value="${phoneType.liveTime }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon" >手机网络</div>
			      <input type="text" class="form-control" value="${phoneType.net }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon" >操作系统</div>
			      <input type="text" class="form-control" value="${phoneType.system }" readonly/>
			    </div>
			    <div class="input-group" style="margin: 10px;">
			      <div class="input-group-addon">下架状态</div>
			      <input type="text" class="form-control" value="${phoneType.phoneTypeState }" readonly/>
			    </div>
		    </div>
	</div>