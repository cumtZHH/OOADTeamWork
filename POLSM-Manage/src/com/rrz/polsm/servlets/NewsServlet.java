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

import com.rrz.polsm.pojo.News;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.service.INewsService;
import com.rrz.polsm.service.IPhoneService;
import com.rrz.polsm.service.impl.NewsServiceImpl;
import com.rrz.polsm.service.impl.PhoneServiceImpl;
import com.rrz.polsm.util.Page;

@WebServlet("/news")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public NewsServlet() {
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
	 * 查询公告新闻
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INewsService newsService = new NewsServiceImpl();
		News news = new News();
		//获取页面属性
		int newsId = -1;
		try {
			newsId = Integer.parseInt(request.getParameter("newsId"));
		} catch (Exception e) {
			
		}
		news.setNewsId(newsId);
		String title = request.getParameter("title");
		news.setTitle(title);
		int newsState = -1;
		try {
			newsState = Integer.parseInt(request.getParameter("newsState"));
		} catch (Exception e) {
			
		}
		news.setNewsState(newsState);
		Map<String,String> map = new HashMap<>();
		String newsTimeStart = request.getParameter("newsTimeStart");
		String newsTimeEnd = request.getParameter("newsTimeEnd");
		if(newsTimeStart!=null){
			map.put("newsTimeStart", newsTimeStart);
		}
		if(newsTimeEnd!=null){
			map.put("newsTimeEnd", newsTimeEnd);
		}
		//分页相关
		int row = 8;//每页显示的数据
		int page = 1;//默认显示第一页
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			
		}
		Page<News> newsPage = newsService.query(news, map, row, page);
		newsPage.setRow(row);
		newsPage.setPage(page);
		Page.paging(request, response, newsPage, "news/innerNewsList");
	}
	/**
	 * 根据Id查找公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INewsService newsService = new NewsServiceImpl();
		int newsId = -1;
		try {
			newsId = Integer.parseInt(request.getParameter("newsId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		News n = newsService.queryByAttr("newsId", newsId);
		request.setAttribute("news", n);
		request.getRequestDispatcher("jsp?name=news/newsDetail").forward(request, response);
	}
	/**
	 * 删除公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INewsService newsService = new NewsServiceImpl();
		int newsId = -1;
		try {
			newsId = Integer.parseInt(request.getParameter("newsId"));
		} catch (Exception e) {
			
		}
		String [] ids = request.getParameterValues("id");
		if(ids!=null){
			newsService.delete(ids);
		}else{
			newsService.delete(newsId);
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
		INewsService newsService = new NewsServiceImpl();
		int newsId = -1;
		try {
			newsId = Integer.parseInt(request.getParameter("newsId"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		News n = newsService.queryByAttr("newsId", newsId);
		request.setAttribute("news", n);
		request.getRequestDispatcher("jsp?name=news/editNews").forward(request, response);
	}
	/**
	 * 编辑公告信息息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INewsService newsService = new NewsServiceImpl();
		int	newsId = Integer.parseInt(request.getParameter("newsId"));
		String title = request.getParameter("title");
		String newsContent = request.getParameter("newsContent");
		String newsTime = request.getParameter("newsTime");
		int newsState = Integer.parseInt(request.getParameter("newsState"));
		News news = new News();
		news.setNewsId(newsId);
		news.setTitle(title);
		news.setNewsContent(newsContent);
		news.setNewsTime(newsTime);
		news.setNewsState(newsState);
		newsService.edit(news);
		request.getRequestDispatcher("jsp?name=news/newsList").forward(request, response);
	}
	/**
	 * 添加公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INewsService newsService = new NewsServiceImpl();
		int newsId = Integer.parseInt(request.getParameter("newsId"));
		/*double phonePrice = Double.parseDouble(request.getParameter("phonePrice"));
		String color = request.getParameter("color");
		String capacity = request.getParameter("capacity");
		//图片随便给的
		String picture = request.getParameter("picture");
		picture="aa";
		String phoneDesc = request.getParameter("phoneDesc");
		Phone p = new Phone();
		p.setPhoneTypeId(phoneTypeId);
		p.setPhonePrice(phonePrice);
		p.setColor(color);
		p.setCapacity(capacity);
		p.setPicture(picture);
		p.setPhoneDesc(phoneDesc);
		phoneService.add(p);*/
		request.getRequestDispatcher("phoneType?op=addType&name=news/phoneList").forward(request, response);
	}
}