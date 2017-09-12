package com.rrz.polsm.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Page<T> {
	/**
	 * 属性
	 */
	private int page;//页码
	private int row;//每页显示的数据
	private int total;//总行数
	private int maxPageNum;//最大页码
	private int pageStart;//显示的开始页码
	private int pageEnd;//显示的结束页码
	private List<T> rows;//每行的数据
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	/**
	 * 分页模式
	 */
	public static void paging(HttpServletRequest request,HttpServletResponse response,Page newPage,String name) throws ServletException, IOException {
		int page = newPage.getPage();
		int row = newPage.getRow();
		int pageStart = 1;//初始默认开始符为1页
		int pageEnd = 5;//初始默认结束符为5页
		try {
			pageStart = Integer.parseInt(request.getParameter("pageStart"));
		} catch (Exception e) {
			
		}
		try {
			pageEnd = Integer.parseInt(request.getParameter("pageEnd"));
		} catch (Exception e) {
			
		}
		//将大于1才可以跳转的页码放到集合中
		List<Integer> pageList = new ArrayList<>();
		if(newPage.getMaxPageNum()>1){
			for(int i=1;i<=newPage.getMaxPageNum();i++){
				pageList.add(i);
			}
		}
		if(pageList.size()>=2){
			request.setAttribute("pageList", pageList);
		}
		//判断是否需要将页码起始值和终止值更改
		if(page>=3&&page<=newPage.getMaxPageNum()-2){
			pageStart = page - 2;
			pageEnd = page +2;
		}
		if(page==newPage.getMaxPageNum()-1){
			pageStart = page - 3>=1?page - 3:1;
			pageEnd = newPage.getMaxPageNum();
		}
		if(page==2&&newPage.getMaxPageNum()>=5){
			pageStart = 1;
			pageEnd = 5;
		}
		//起始值和初始值的判断
		if(newPage.getTotal()==0){
			pageStart = 0;
		}
		if(newPage.getMaxPageNum()<5){
			pageEnd = newPage.getMaxPageNum();
		}
		//给page对象设置参数
		newPage.setPage(page);
		newPage.setRow(row);
		newPage.setPageStart(pageStart);
		newPage.setPageEnd(pageEnd);
		request.setAttribute("sp", newPage);
		request.setAttribute("list",newPage.getRows());
		request.getRequestDispatcher("jsp?name="+name).forward(request, response);
	}
	
}
