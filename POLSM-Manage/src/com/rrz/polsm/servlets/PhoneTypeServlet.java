package com.rrz.polsm.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rrz.polsm.pojo.PhoneType;
import com.rrz.polsm.service.IPhoneTypeService;
import com.rrz.polsm.service.impl.PhoneTypeServiceImpl;
import com.rrz.polsm.util.Page;


@WebServlet("/phoneType")
public class PhoneTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PhoneTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String name = request.getParameter("name");
		switch (op) {
		case "addType":
			addType(request,response,name);
			break;
		case "query":
			query(request, response);
			break;
		case "queryById":
			queryById(request, response);
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
			delete(request,response);
			break;
		default:
			response.sendRedirect("404.jsp");
			break;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * 加载手机类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addType(HttpServletRequest request, HttpServletResponse response,String name) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		Page<PhoneType> phoneTypePage = phoneTypeService.query(null,null, 0, 0);
		List<PhoneType> phoneTypes = phoneTypePage.getRows();
		if(name.equals("null")){
			String json = new ObjectMapper().writeValueAsString(phoneTypes);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(json.toString());
			out.flush();
			out.close();
		}else{
			request.setAttribute("phoneTypeList", phoneTypes);
			request.getRequestDispatcher("jsp?name="+name).forward(request, response);
		}
	}
	/**
	 * 查询手机类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		PhoneType phoneType = new PhoneType();
		//获取页面属性
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		phoneType.setPhoneTypeId(phoneTypeId);
		String size = request.getParameter("size");
		phoneType.setSize(size);
		String cpu = request.getParameter("cpu");
		phoneType.setCpu(cpu);
		int state = -1;
		try {
			state = Integer.parseInt(request.getParameter("phoneTypeState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String pixel = request.getParameter("pixel");
		phoneType.setPixel(pixel);
		phoneType.setPhoneTypeState(state);
		//分页相关
		int row = 8;//每页显示的数据
		int page = 1;//默认显示第一页
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<PhoneType> phoneTypePage = phoneTypeService.query(phoneType,null,row,page);
		phoneTypePage.setRow(row);
		phoneTypePage.setPage(page);
		Page.paging(request, response, phoneTypePage,"phoneType/innerPhoneTypeList");
	}
	/**
	 * 根据Id查找手机类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PhoneType pt = phoneTypeService.queryByAttr("phoneTypeId", phoneTypeId);
		request.setAttribute("phoneType", pt);
		request.getRequestDispatcher("jsp?name=phoneType/phoneTypeDetail").forward(request, response);
	}
	/**
	 * 进入编辑前的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void inputEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		PhoneType pt = phoneTypeService.queryByAttr("phoneTypeId", phoneTypeId);
		request.setAttribute("phoneType", pt);
		request.getRequestDispatcher("jsp?name=phoneType/editPhoneType").forward(request, response);
	}
	/**
	 * 编辑商品类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String phoneTypeName = request.getParameter("phoneTypeName");
		String size = request.getParameter("size");
		String weight = request.getParameter("weight");
		String callTime = request.getParameter("callTime");
		String liveTime = request.getParameter("liveTime");
		String cpu = request.getParameter("cpu");
		String pixel = request.getParameter("pixel");
		String system = request.getParameter("system");
		String phoneTypeTime = request.getParameter("phoneTypeTime");
		String mainPicture = request.getParameter("mainPicture");
		String net = request.getParameter("net");
		double phoneTypePrice = 0;
		try {
			phoneTypePrice = Double.parseDouble(request.getParameter("phoneTypePrice"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int phoneTypeState = Integer.parseInt(request.getParameter("phoneTypeState"));
		PhoneType pt = new PhoneType();
		pt.setPhoneTypeId(phoneTypeId);
		pt.setPhoneTypeName(phoneTypeName);
		pt.setSize(size);
		pt.setWeight(weight);
		pt.setCallTime(callTime);
		pt.setLiveTime(liveTime);
		pt.setCpu(cpu);
		pt.setPixel(pixel);
		pt.setSystem(system);
		pt.setPhoneTypeTime(phoneTypeTime);
		pt.setMainPicture("我是主图");
		pt.setNet(net);
		pt.setPhoneTypePrice(phoneTypePrice);
		pt.setPhoneTypeState(phoneTypeState);
		phoneTypeService.edit(pt);
		request.getRequestDispatcher("phoneType?op=addType&name=phoneType/phoneTypeList").forward(request, response);
	}
	/**
	 * 添加一个商品类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		String phoneTypeName = request.getParameter("phoneTypeName");
		String size = request.getParameter("size");
		String weight = request.getParameter("weight");
		String callTime = request.getParameter("callTime");
		String liveTime = request.getParameter("liveTime");
		String cpu = request.getParameter("cpu");
		String pixel = request.getParameter("pixel");
		String system = request.getParameter("system");
		String phoneTypeTime = request.getParameter("phoneTypeTime");
		String net = request.getParameter("net");
		String mainPicture = request.getParameter("mainPicture");
		double phoneTypePrice = 0;
		try {
			phoneTypePrice = Double.parseDouble(request.getParameter("phoneTypePrice"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PhoneType pt = new PhoneType();
		pt.setPhoneTypeName(phoneTypeName);
		pt.setSize(size);
		pt.setWeight(weight);
		pt.setCallTime(callTime);
		pt.setLiveTime(liveTime);
		pt.setCpu(cpu);
		pt.setPixel(pixel);
		pt.setSystem(system);
		pt.setPhoneTypeTime(phoneTypeTime);
		pt.setNet(net);
		pt.setMainPicture("我是手机类型的主图");
		pt.setPhoneTypePrice(phoneTypePrice);
		phoneTypeService.add(pt);
		request.getRequestDispatcher("phoneType?op=addType&name=phoneTypeList").forward(request, response);
	}
	/**
	 * 删除手机类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPhoneTypeService phoneTypeService = new PhoneTypeServiceImpl();
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			phoneTypeService.delete(ids);
		}else{
			phoneTypeService.delete(phoneTypeId);
		}
		query(request, response);
	}

}
