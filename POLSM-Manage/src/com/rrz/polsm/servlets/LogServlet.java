package com.rrz.polsm.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rrz.polsm.pojo.Log;
import com.rrz.polsm.service.ILogService;
import com.rrz.polsm.service.impl.LogServiceImpl;
import com.rrz.polsm.util.Page;

@WebServlet("/log")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILogService logService = new LogServiceImpl();
		Log log = new Log();
		//获取页面数据
		int logId = -1;
		try {
			logId = Integer.parseInt(request.getParameter("logId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		log.setlogId(logId);
		String message = request.getParameter("message");
		log.setMessage(message);
		String logTimeStart = request.getParameter("logTimeStart");
		String logTimeEnd = request.getParameter("logTimeEnd");
		Map<String,String> map = new HashMap<>();
		if(logTimeStart!=null&&!"".equals(logTimeStart)){
			map.put("logTimeStart", logTimeStart);
		}
		if(logTimeEnd!=null&&!"".equals(logTimeEnd)){
			map.put("logTimeEnd", logTimeEnd);
		}
		int row = 10;//每页显示的数据
		int page = 1;//默认显示第一页
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<Log> logPage = logService.query(log, map, row, page);
		logPage.setRow(row);
		logPage.setPage(page);
		Page.paging(request, response, logPage, "log/innerLogList");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
