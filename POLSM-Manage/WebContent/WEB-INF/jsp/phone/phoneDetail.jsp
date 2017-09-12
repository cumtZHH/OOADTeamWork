<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="row">
		  <div class="col-md-6">
		  	<div><img src="${phone.picture }" style="width: 70%;margin-left: 15%"/></div>
		  	<div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >操作系统</div>
		      <input type="text" class="form-control" value="${phone.system }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >上市时间</div>
		      <input type="text" class="form-control" value="${phone.phoneTypeTime }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >手机网络</div>
		      <input type="text" class="form-control" value="${phone.net }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >CPU核数</div>
		      <input type="text" class="form-control" value="${phone.cpu }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >手机像素</div>
		      <input type="text" class="form-control" value="${phone.pixel }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >详情描述</div>
		      <textarea style="width: 260px;height: 50px" readonly>${phone.phoneDesc }</textarea>
		    </div>
		  </div>
		  <div class="col-md-6">
	  		<div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">手机编号</div>
		      <input type="text" class="form-control" value="${phone.phoneId }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">手机类型</div>
		      <input type="text" class="form-control" value="${phone.phoneTypeName }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">手机价格</div>
		      <input type="text" class="form-control" value="${phone.phonePrice }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">手机颜色</div>
		      <input type="text" class="form-control" value="${phone.color }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">手机容量</div>
		      <input type="text" class="form-control" value="${phone.capacity }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >手机尺寸</div>
		      <input type="text" class="form-control" value="${phone.size }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >手机重量</div>
		      <input type="text" class="form-control" value="${phone.weight }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >电池容量</div>
		      <input type="text" class="form-control" value="${phone.callTime }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon" >待机时间</div>
		      <input type="text" class="form-control" value="${phone.liveTime }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">下架状态</div>
		      <input type="text" class="form-control" value="${phone.phoneTypeState=='0'?'上架中':'已下架' }" readonly/>
		    </div>
		    <div class="input-group" style="margin: 3px;">
		      <div class="input-group-addon">售卖状态</div>
		       <input type="text" class="form-control" value="${phone.phoneState=='0'?'未售出':'已卖' }" readonly/>
			 </div>
			</div>
		</div>