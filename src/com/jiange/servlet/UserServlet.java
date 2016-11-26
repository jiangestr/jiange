package com.jiange.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jiange.dao.DaoFactory;
import com.jiange.dao.UserDao;
import com.jiange.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username == null ||password == null){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		//开启数据库，线程连接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		UserDao userDao = dao.getUserDao();
		User user =  userDao.selectUser(username, password);
		
		//使用完，关闭连接。
		dao.closeConnection();
		
		
		//判断用户是否存在
		if(user != null){
			request.getSession().setAttribute("currentUser", user);//保存存在的用户
			request.getSession().setAttribute("user", 1);//设置user存在为1
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}

