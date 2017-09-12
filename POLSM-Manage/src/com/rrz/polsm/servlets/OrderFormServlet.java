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
import com.rrz.polsm.pojo.Address;
import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.pojo.OrderState;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.pojo.User;
import com.rrz.polsm.service.IAddressService;
import com.rrz.polsm.service.IOrderFormService;
import com.rrz.polsm.service.impl.AddressServiceImpl;
import com.rrz.polsm.service.impl.OrderFormServiceImpl;
import com.rrz.polsm.util.Page;


@WebServlet("/orderForm")
public class OrderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "query":
			query(request,response);
			break;
		case "queryById":
			queryById(request,response);
			break;
		case "inputEdit":
			inputEdit(request,response);
			break;
		case "edit":
			edit(request,response);
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * ��������ѯ����
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		Map<String,String> map = new HashMap<>();
		//��װ�û�����
		User user = new User();
		String userName = request.getParameter("userName");
		user.setUserName(userName);
		//��װ�ֻ�����
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
		//��װ����������
		OrderState orderState = new OrderState();
		String orderStateDesc = request.getParameter("orderStateDesc");
		orderState.setOrderStateDesc(orderStateDesc);
		//��װ����ϸ�ڱ�
		List<OrderDetail> orderDetailList = new ArrayList<>();
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setPhone(phone);
		orderDetailList.add(orderDetail);
		//��װ������
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
		//��װʱ��
		String orderStateTimeStart = request.getParameter("orderStateTimeStart");
		String orderStateTimeEnd = request.getParameter("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			map.put("orderStateTimeStart", orderStateTimeStart);
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			map.put("orderStateTimeEnd", orderStateTimeEnd);
		}
		int row = 5;//ÿҳ��ʾ������
		int page = 1;//Ĭ����ʾ��һҳ
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<OrderForm> orderFormPage = orderFormService.query(orderForm,map,row,page);
		orderFormPage.setPage(page);
		orderFormPage.setRow(row);
		Page.paging(request, response, orderFormPage, "orderForm/innerOrderFormList");
	}
	/**
	 * ���ݶ�����Ų�ѯ������Ϣ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderFormId = request.getParameter("orderFormId");
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		OrderForm of = orderFormService.queryByAttr("orderFormId", orderFormId);
		request.setAttribute("orderForm", of);
		request.getRequestDispatcher("jsp?name=orderForm/orderFormDetail").forward(request, response);
	}
	/**
	 * ����༭ǰ�ķ���
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void inputEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderFormId = request.getParameter("orderFormId");
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		OrderForm of = orderFormService.queryByAttr("orderFormId", orderFormId);
		request.setAttribute("orderForm", of);
		request.getRequestDispatcher("jsp?name=orderForm/editOrderForm").forward(request, response);
	}
	/**
	 * �༭
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOrderFormService orderFormService = new OrderFormServiceImpl();
		IAddressService addressService = new AddressServiceImpl();
		//�޸��ջ���ַ
		String receiverName = request.getParameter("receiverName");
		String receiverTel = request.getParameter("receiverTel");
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String addressInfo = request.getParameter("addressInfo");
		String postcode = request.getParameter("postcode");
		double orderFormPrice = 0;
		try {
			orderFormPrice = Double.parseDouble(request.getParameter("orderFormPrice"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Address address = new Address();
		address.setReceiverName(receiverName);
		address.setReceiverTel(receiverTel);
		address.setUserId(userId);
		address.setAddressInfo(addressInfo);
		address.setPostcode(postcode);
		addressService.add(address);
		int addressId = addressService.queryLatest();
		String orderFormId = request.getParameter("orderFormId");
		OrderForm of = orderFormService.queryByAttr("orderFormId", orderFormId);
		of.setAddressId(addressId);
		of.setOrderFormPrice(orderFormPrice);
		orderFormService.edit(of);
	}

}
