package com.rrz.polsm.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.pojo.OrderState;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.pojo.User;
import com.rrz.polsm.service.IOrderFormService;
import com.rrz.polsm.service.impl.OrderFormServiceImpl;
import com.rrz.polsm.util.Page;

/**
 * Servlet implementation class OrderFormSuccessServlet
 */
@WebServlet("/orderFormSuccess")
public class OrderFormSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFormSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "query":
			query(request,response);
			break;
		case "delete":
			delete(request,response);
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * 查询所有交易完成的订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		Map<String,String> map = new HashMap<>();
		//封装用户对象
		User user = new User();
		String userName = request.getParameter("userName");
		user.setUserName(userName);
		//封装手机对象
		Phone phone = new Phone();
		String phoneTypeName = request.getParameter("phoneTypeName");
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		phone.setPhoneTypeName(phoneTypeName);
		phone.setPhoneTypeId(phoneTypeId);
		//封装订单类别对象
		OrderState orderState = new OrderState();
		String orderStateDesc = request.getParameter("orderStateDesc");
		orderState.setOrderStateDesc(orderStateDesc);
		//封装订单细节表
		List<OrderDetail> orderDetailList = new ArrayList<>();
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setPhone(phone);
		orderDetailList.add(orderDetail);
		//封装订单表
		OrderForm orderForm = new OrderForm();
		String orderFormId = request.getParameter("orderFormId");
		int orderFormState = -1;
		try {
			orderFormState = Integer.parseInt(request.getParameter("orderFormState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		orderForm.setOrderFormId(orderFormId);
		orderForm.setOrderFormState(orderFormState);
		orderForm.setUser(user);
		orderForm.setOrderState(orderState);
		orderForm.setOrderDetailList(orderDetailList);
		//封装时间
		String orderStateTimeStart = request.getParameter("orderStateTimeStart");
		String orderStateTimeEnd = request.getParameter("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			map.put("orderStateTimeStart", orderStateTimeStart);
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			map.put("orderStateTimeEnd", orderStateTimeEnd);
		}
		int row = 5;//每页显示的数据
		int page = 1;//默认显示第一页
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<OrderForm> orderFormPage = orderFormService.querySuccess(orderForm,map,row,page);
		orderFormPage.setPage(page);
		orderFormPage.setRow(row);
		Page.paging(request, response, orderFormPage, "orderFormSuccess/innerOrderFormSuccessList");
	}
	/**
	 * 删除订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		String orderFormId = request.getParameter("orderFormId");
		String [] orderFormIds = request.getParameterValues("ids");
		if(orderFormIds!=null){
			orderFormService.delete(orderFormIds);
		}else{
			orderFormService.delete(orderFormId);
		}
		query(request, response);
	}

}
