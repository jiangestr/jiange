package com.jiange.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.dao.DaoFactory;
import com.jiange.dao.UserDao;
import com.jiange.model.User;

/**
 * Servlet implementation class ChangePassWordServlet
 */
@WebServlet("/ChangePassWordServlet")
public class ChangePassWordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassWordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 根据action的值选择执行语句
		String action = request.getParameter("action");
		if(action.equals("showPage")){
			request.setAttribute("mainPage", "userui/changePass.jsp");
			request.getRequestDispatcher("/user.jsp").forward(request, response);
		}
		if(action.equals("changePassWord")){
			if(changePassWord(request, response)){
				//如果更新密码成功就清除session中的currentuser对象，并回到登录页面。
				request.getSession().setAttribute("currentUser", null);
				response.sendRedirect(request.getContextPath()+"/login.jsp");
			}
			else{
				request.setAttribute("mainPage", "userui/fault.jsp");
				response.sendRedirect(request.getContextPath()+"/user.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private boolean changePassWord(HttpServletRequest request, HttpServletResponse response){
		boolean flag = false;
		
		//从前台获取用户信息，和表单提交的新密码
		User user = (User)request.getSession().getAttribute("currentUser");
		String newPassWord = request.getParameter("newPassWord");
		
		//连接数据库
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		//获取UserDao,并更新密码。
		UserDao userDao = dao.getUserDao();
		if(userDao.updateUser(user, newPassWord)){
			flag = true;
		}
		return flag;
	}
}
