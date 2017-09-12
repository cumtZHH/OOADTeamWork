package com.rrz.polsm.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rrz.polsm.pojo.Level;
import com.rrz.polsm.service.ILevelService;
import com.rrz.polsm.service.impl.LevelServiceImpl;
import com.rrz.polsm.util.Page;


@WebServlet("/level")
public class LevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LevelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch (op) {
		case "addType":
			addType(request,response);
			break;
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
	 * �����û��ȼ���Ϣ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		Page<Level> levelpage = levelService.query(null, null, 0, 0);
		List<Level> levels = levelpage.getRows();
		String name = request.getParameter("name");
		if(name.equals("null")){
			String json = new ObjectMapper().writeValueAsString(levels);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		}else{
			request.setAttribute("levels", levels);
			request.getRequestDispatcher("jsp?name="+name).forward(request, response);
		}
	}
	/**
	 * ��ѯ�û��ȼ�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		Level level = new Level();
		//��ȡҳ������
		int levelId = -1;
		try {
			levelId = Integer.parseInt(request.getParameter("levelId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		level.setLevelId(levelId);
		int levelState = -1;
		try {
			levelState = Integer.parseInt(request.getParameter("levelState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		level.setLevelState(levelState);
		//��ҳ���
		int row = 10;//ÿҳ��ʾ������
		int page = 1;//Ĭ����ʾ��һҳ
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<Level> levelPage = levelService.query(level,null,row,page);
		levelPage.setRow(row);
		levelPage.setPage(page);
		Page.paging(request, response, levelPage,"level/innerLevelList");
	}
	/**
	 * ����Id�����û��ȼ�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		int levelId = -1;
		try {
			levelId = Integer.parseInt(request.getParameter("levelId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Level l = levelService.queryByAttr("levelId", levelId);
		request.setAttribute("level", l);
		request.getRequestDispatcher("jsp?name=level/levelDetail").forward(request, response);
	}
	/**
	 * ɾ���ȼ�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		int levelId = -1;
		try {
			levelId = Integer.parseInt(request.getParameter("levelId"));
		} catch (Exception e) {
			
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			levelService.delete(ids);
		}else{
			levelService.delete(levelId);
		}
		query(request, response);
		
	}
	/**
	 * ����༭ǰ�ķ���
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void inputEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		int levelId = -1;
		try {
			levelId = Integer.parseInt(request.getParameter("levelId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Level l = levelService.queryByAttr("levelId", levelId);
		request.setAttribute("level", l);
		request.getRequestDispatcher("jsp?name=level/editLevel").forward(request, response);
	}
	/**
	 * �༭�ȼ���Ϣ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILevelService levelService = new LevelServiceImpl();
		int	levelId = Integer.parseInt(request.getParameter("levelId"));
		String levelName = request.getParameter("levelName");
		String levelDesc = request.getParameter("levelDesc");
		double discount = Double.parseDouble(request.getParameter("discount"));
		int levelState = Integer.parseInt(request.getParameter("levelState"));
		Level l = new Level();
		l.setLevelId(levelId);
		l.setLevelName(levelName);
		l.setLevelDesc(levelDesc);
		l.setDiscount(discount);
		l.setLevelState(levelState);
		levelService.edit(l);
		request.getRequestDispatcher("level?op=addType&name=level/levelList").forward(request, response);
	}
	/**
	 * ��ӵȼ�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}