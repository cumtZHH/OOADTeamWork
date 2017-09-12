package com.rrz.polsm.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.service.IPhoneService;
import com.rrz.polsm.service.impl.PhoneServiceImpl;
import com.rrz.polsm.util.Page;


@WebServlet("/phone")
public class PhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public PhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		case "add":
			add(request,response);
			break;
		case "delete":
			delete(request, response);
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
	 * 查询手机
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		Phone phone = new Phone();
		//获取页面属性
		int phoneId = -1;
		Map<String,Integer> map = new HashMap<String,Integer>();
		try {
			phoneId = Integer.parseInt(request.getParameter("phoneId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		phone.setPhoneId(phoneId);
		String type = request.getParameter("type");
		if(type!=null&&!type.equals("-1")){
			phone.setPhoneTypeName(type);
		}
		String price = request.getParameter("price");
		int priceStart = 0;
		int priceEnd = 0;
		if(price!=null){
			switch (price) {
			case "1":
				priceEnd = 1000;
				break;
			case "2":
				priceStart = 1000;
				priceEnd = 1500;	
				break;
			case "3":
				priceStart = 1500;
				priceEnd = 3000;
				break;
			case "4":
				priceStart = 3000;
				priceEnd = 5000;
				break;
			case "5":
				priceStart = 5000;
				break;
			}
		}
		map.put("priceStart", priceStart);
		map.put("priceEnd", priceEnd);
		int state = -1;
		try {
			state = Integer.parseInt(request.getParameter("phoneState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		phone.setPhoneState(state);
		//分页相关
		int row = 9;//每页显示的数据
		int page = 1;//默认显示第一页
		//获取页面用户请求的参数
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<Phone> phonePage = phoneService.query(phone,map,row,page);
		phonePage.setPage(page);
		phonePage.setRow(row);
		Page.paging(request, response, phonePage,"phone/innerPhoneList");
	}
	/**
	 * 根据Id查找手机
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		int phoneId = -1;
		try {
			phoneId = Integer.parseInt(request.getParameter("phoneId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Phone p = phoneService.queryByAttr("phoneId", phoneId);
		request.setAttribute("phone", p);
		request.getRequestDispatcher("jsp?name=phone/phoneDetail").forward(request, response);
	}
	/**
	 * 删除手机
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		int phoneId = -1;
		try {
			phoneId = Integer.parseInt(request.getParameter("phoneId"));
		} catch (Exception e) {
			
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			phoneService.delete(ids);
		}else{
			phoneService.delete(phoneId);
		}
		query(request, response);
		
	}
	/**
	 * 进入编辑前的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void inputEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		int phoneId = -1;
		try {
			phoneId = Integer.parseInt(request.getParameter("phoneId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Phone p = phoneService.queryByAttr("phoneId", phoneId);
		request.setAttribute("phone", p);
		request.getRequestDispatcher("phoneType?op=addType&name=phone/editPhone").forward(request, response);
	}
	/**
	 * 编辑手机
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		int	phoneId = Integer.parseInt(request.getParameter("phoneId"));
		int phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		double phonePrice = Double.parseDouble(request.getParameter("phonePrice"));
		String color = request.getParameter("color");
		String capacity = request.getParameter("capacity");
		String phoneDesc = request.getParameter("phoneDesc");
		int phoneState = Integer.parseInt(request.getParameter("phoneState"));
		Phone p = new Phone();
		p.setPhoneId(phoneId);
		p.setPhoneTypeId(phoneTypeId);
		p.setPhonePrice(phonePrice);
		p.setColor(color);
		p.setCapacity(capacity);
		p.setPhoneDesc(phoneDesc);
		p.setPhoneState(phoneState);
		phoneService.edit(p);
		request.getRequestDispatcher("phoneType?op=addType&name=phone/phoneList").forward(request, response);
	}
	/**
	 * 添加手机
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneService phoneService = new PhoneServiceImpl();
		int phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		double phonePrice = Double.parseDouble(request.getParameter("phonePrice"));
		String color = request.getParameter("color");
		String capacity = request.getParameter("capacity");
		//图片随便给的
		String picture = request.getParameter("picture");
		picture="aa";
		String phoneDesc = request.getParameter("phoneDesc");
		int num = -1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Phone p = new Phone();
		p.setPhoneTypeId(phoneTypeId);
		p.setPhonePrice(phonePrice);
		p.setColor(color);
		p.setCapacity(capacity);
		p.setPicture(picture);
		p.setPhoneDesc(phoneDesc);
		if(num!=-1){
			for (int i = 0; i < num; i++) {
				phoneService.add(p);
			}
		}
		request.getRequestDispatcher("phoneType?op=addType&name=phone/phoneList").forward(request, response);
	}
}