package com.rrz.polsm.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rrz.polsm.pojo.Log;
import com.rrz.polsm.pojo.Manager;
import com.rrz.polsm.service.ILogService;
import com.rrz.polsm.service.IManagerService;
import com.rrz.polsm.service.impl.LogServiceImpl;
import com.rrz.polsm.service.impl.ManagerServiceImpl;

@WebServlet("/manager")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op==null){
			response.sendRedirect("404.jsp");
			return;
		}
		switch (op) {
		case "login":
			login(request, response);
			break;
		case "exit":
			exit(request,response);
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
	 * 登录
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IManagerService managerService = new ManagerServiceImpl();
		ILogService logService = new LogServiceImpl();
		//Logger logger = Logger.getLogger(Manager.class);
		HttpSession session = request.getSession();
		//先验证验证码
		String code = request.getParameter("code");
		if(!code.equals(session.getAttribute("code"))){
			request.setAttribute("loginError", "验证码不正确");
			request.getRequestDispatcher("jsp?name=login").forward(request, response);
			return;
		}
		//再验证登录名和密码
		String loginName = request.getParameter("loginName");
		String loginPass = request.getParameter("loginPass");
		Manager m = managerService.login(loginName, loginPass);
		if(m==null){
			request.setAttribute("loginError", "请输入正确的用户名和密码");
			request.getRequestDispatcher("jsp?name=login").forward(request, response);
			return;
		}else{
			session.setAttribute("managerMessage", m);
			//记录当前登录日志
			int managerId = m.getManagerId();
			String ipAddress = "";
			if (request.getHeader("x-forwarded-for") == null) {
				ipAddress = request.getRemoteAddr();
			}else{
				ipAddress = request.getHeader("x-forwarded-for");
			}
			String message = loginName+"登入系统";
			String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			Log log = new Log();
			log.setloginName(loginName);
			log.setIpAddress(ipAddress);
			log.setLogTime(logTime);
			log.setManagerId(managerId);
			log.setMessage(message);
			logService.add(log);
			/*MDC.put("managerId", managerId);
			MDC.put("message", message);
			MDC.put("ipAddress", ipAddress);
			logger.info("");
			logger.debug(managerId+logTime+message);*/
			response.sendRedirect("jsp?name=main");
		}
	}
	/**
	 * 退出系统
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILogService logService = new LogServiceImpl();
		//清空session信息
		HttpSession session = request.getSession();
		Manager m = (Manager)session.getAttribute("managerMessage");
		session.invalidate();
		//记录当前登录日志
		int managerId = m.getManagerId();
		String ipAddress = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ipAddress = request.getRemoteAddr();
		}else{
			ipAddress = request.getHeader("x-forwarded-for");
		}
		String message = m.getLoginName()+"退出系统";
		String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Log log = new Log();
		log.setManagerId(managerId);
		log.setIpAddress(ipAddress);
		log.setMessage(message);
		log.setLogTime(logTime);
		logService.add(log);
		request.getRequestDispatcher("jsp?name=login").forward(request, response);
	}

}
