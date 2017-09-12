package com.rrz.polsm.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rrz.polsm.pojo.Comment;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.service.ICommentService;
import com.rrz.polsm.service.impl.CommentServiceImpl;
import com.rrz.polsm.util.Page;


@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CommentServlet() {
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
		case "delete":
			delete(request,response);
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
	 * ��ѯ����
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICommentService commentService = new CommentServiceImpl();
		//����ǰ̨����
		String userName = request.getParameter("userName");
		int phoneTypeId = -1;
		try {
			phoneTypeId = Integer.parseInt(request.getParameter("phoneTypeId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String commentLevel = request.getParameter("commentLevel");
		int commentState = -1;
		try {
			commentState = Integer.parseInt(request.getParameter("commentState"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		Phone p = new Phone();
		p.setPhoneTypeId(phoneTypeId);
		Comment c = new Comment();
		c.setUserName(userName);
		c.setCommentLevel(commentLevel);
		c.setCommentState(commentState);
		c.setPhone(p);
		Map<String,String> map = new HashMap<>();
		String commentTimeStart = request.getParameter("commentTimeStart");
		String commentTimeEnd = request.getParameter("commentTimeEnd");
		map.put("commentTimeStart", commentTimeStart);
		map.put("commentTimeEnd", commentTimeEnd);
		//��ҳ���
		int row = 6;//ÿҳ��ʾ������
		int page = 1;//Ĭ����ʾ��һҳ
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<Comment> commentPage = commentService.query(c,map,row,page);
		commentPage.setPage(page);
		commentPage.setRow(row);
		Page.paging(request, response, commentPage, "comment/innerCommentList");
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICommentService commentService = new CommentServiceImpl();
		int commentId = -1;
		try {
			commentId = Integer.parseInt(request.getParameter("commentId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Comment c = commentService.queryById(commentId);
		request.setAttribute("comment", c);
		request.getRequestDispatcher("jsp?name=comment/commentDetail").forward(request, response);
	}
	/**
	 * ɾ������
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICommentService commentService = new CommentServiceImpl();
		int commentId = -1;
		try {
			commentId = Integer.parseInt(request.getParameter("commentId"));
		} catch (Exception e) {
			
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			commentService.delete(ids);
		}else{
			commentService.delete(commentId);
		}
		query(request, response);
	}

}
