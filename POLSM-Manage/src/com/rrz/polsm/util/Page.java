package com.rrz.polsm.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Page<T> {
	/**
	 * ����
	 */
	private int page;//ҳ��
	private int row;//ÿҳ��ʾ������
	private int total;//������
	private int maxPageNum;//���ҳ��
	private int pageStart;//��ʾ�Ŀ�ʼҳ��
	private int pageEnd;//��ʾ�Ľ���ҳ��
	private List<T> rows;//ÿ�е�����
	
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
	 * ��ҳģʽ
	 */
	public static void paging(HttpServletRequest request,HttpServletResponse response,Page newPage,String name) throws ServletException, IOException {
		int page = newPage.getPage();
		int row = newPage.getRow();
		int pageStart = 1;//��ʼĬ�Ͽ�ʼ��Ϊ1ҳ
		int pageEnd = 5;//��ʼĬ�Ͻ�����Ϊ5ҳ
		try {
			pageStart = Integer.parseInt(request.getParameter("pageStart"));
		} catch (Exception e) {
			
		}
		try {
			pageEnd = Integer.parseInt(request.getParameter("pageEnd"));
		} catch (Exception e) {
			
		}
		//������1�ſ�����ת��ҳ��ŵ�������
		List<Integer> pageList = new ArrayList<>();
		if(newPage.getMaxPageNum()>1){
			for(int i=1;i<=newPage.getMaxPageNum();i++){
				pageList.add(i);
			}
		}
		if(pageList.size()>=2){
			request.setAttribute("pageList", pageList);
		}
		//�ж��Ƿ���Ҫ��ҳ����ʼֵ����ֵֹ����
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
		//��ʼֵ�ͳ�ʼֵ���ж�
		if(newPage.getTotal()==0){
			pageStart = 0;
		}
		if(newPage.getMaxPageNum()<5){
			pageEnd = newPage.getMaxPageNum();
		}
		//��page�������ò���
		newPage.setPage(page);
		newPage.setRow(row);
		newPage.setPageStart(pageStart);
		newPage.setPageEnd(pageEnd);
		request.setAttribute("sp", newPage);
		request.setAttribute("list",newPage.getRows());
		request.getRequestDispatcher("jsp?name="+name).forward(request, response);
	}
	
}
