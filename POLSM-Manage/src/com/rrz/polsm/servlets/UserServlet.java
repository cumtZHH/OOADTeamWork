package com.rrz.polsm.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rrz.polsm.pojo.User;
import com.rrz.polsm.service.IUserService;
import com.rrz.polsm.service.impl.UserServiceImpl;
import com.rrz.polsm.util.Page;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * ��������
	 */
	private IUserService userService = new UserServiceImpl();

    public UserServlet() {
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
	 * ��ѯ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		Map<String,String> map = new HashMap<String,String>();
		//��ȡҳ������
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String loginName = request.getParameter("loginName");
		String userName = request.getParameter("userName");
		String tel = request.getParameter("tel");
		String consume = request.getParameter("consume");
		if(consume!=null&&!consume.equals("-1")&&!consume.equals("")){
			String [] strs = consume.split("-");
			map.put("consumeStart", strs[0]);
			map.put("consumeEnd", strs[1]);
		}
		int userState = -1;
		try {
			userState = Integer.parseInt(request.getParameter("userState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String registerTimeStart = request.getParameter("registerTimeStart");
		String registerTimeEnd = request.getParameter("registerTimeEnd");
		//��װҳ�����
		user.setUserId(userId);
		user.setLoginName(loginName);
		user.setUserName(userName);
		user.setTel(tel);
		user.setUserState(userState);
		if(registerTimeStart!=null&&!registerTimeStart.equals("")){
			map.put("registerTimeStart", registerTimeStart);
		}
		if(registerTimeEnd!=null&&!registerTimeEnd.equals("")){
			map.put("registerTimeEnd", registerTimeEnd);
		}
		//��ҳ���
		int row = 6;//ÿҳ��ʾ������
		int page = 1;//Ĭ����ʾ��һҳ
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<User> userPage = userService.query(user,map,row,page);
		userPage.setPage(page);
		userPage.setRow(row);
		Page.paging(request, response, userPage, "user/innerUserList");
	}
	/**
	 * �������������û�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		User u = userService.queryByAttr("userId", userId);
		request.setAttribute("user", u);
		request.getRequestDispatcher("jsp?name=user/userDetail").forward(request, response);
	}
	/**
	 * ����༭ǰ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException�ķ���
	 */
	private void inputEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		User u = userService.queryByAttr("userId", userId);
		request.setAttribute("user", u);
		request.getRequestDispatcher("level?op=addType&name=user/editUser").forward(request, response);
	}
	/**
	 * �༭�û�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String loginName = request.getParameter("loginName");
		String userName = request.getParameter("userName");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String passQuestion = request.getParameter("passQuestion");
		String passAnswer = request.getParameter("passAnswer");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String IDCard = request.getParameter("IDCard");
		double money = 0;
		try {
			money = Double.parseDouble(request.getParameter("money"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int levelId = -1;
		try {
			levelId = Integer.parseInt(request.getParameter("levelId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int userState = -1;
		try {
			userState = Integer.parseInt(request.getParameter("userState"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		User u = new User();
		u.setUserId(userId);
		u.setLoginName(loginName);
		u.setUserName(userName);
		u.setGender(gender);
		u.setPassQuestion(passQuestion);
		u.setPassAnswer(passAnswer);
		u.setEmail(email);
		u.setTel(tel);
		u.setIDCard(IDCard);
		u.setLevelId(levelId);
		u.setMoney(money);
		u.setUserState(userState);
		userService.edit(u);
		request.getRequestDispatcher("jsp?name=user/userList").forward(request, response);
	}
	/**
	 * ����û�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	/**
	 * ɾ���û�
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			userService.delete(ids);
		}else{
			userService.delete(userId);
		}
		query(request, response);
	}

}
