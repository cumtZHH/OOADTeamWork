package com.rrz.polsm.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/code")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletOutputStream out = null;
		//建立图片缓冲区
		BufferedImage image = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);
		//获得一支画笔
		Graphics g = image.getGraphics();
		//填充颜色
		g.setColor(new Color(204, 204, 204));
		//填充整个背景
		g.fillRect(0, 0, 100, 30);
		String code = "";
		for (int i = 0; i < 4; i++) {
			int s = (int)(Math.random()*10);
			g.setColor(new Color(100+(int)(Math.random()*75), 100+(int)(Math.random()*75), 255));
			g.setFont(new Font("黑体",Font.BOLD, 24));
			g.drawString(s+"", 20*i, 20);
			code += s;
		}
		HttpSession session = request.getSession();
		session.setAttribute("code", code);
		out = response.getOutputStream();
		ImageIO.write(image, "jpeg", out);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
