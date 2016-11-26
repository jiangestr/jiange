package com.jiange.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.model.User;
import com.jiange.model.UserInf;

/**
 * Servlet implementation class UserInf
 */
@WebServlet("/UserInf")
public class UserInfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 显示用户信息和保存用户信息
		String action = request.getParameter("action");
		if(action.equals("showInf")){
			request.setAttribute("mainPage", "userui/userinf.jsp");
			request.getRequestDispatcher("/user.jsp").forward(request, response);
		}
		if(action.equals("changeInf")){
			changeInf(request, response);
			request.setAttribute("mainPage", "userui/success.jsp");
			request.getRequestDispatcher("/user.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void changeInf(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		
		//获取表单提交的用户信息
		String userName = ((User)request.getSession().getAttribute("currentUser")).getUsername();
		String petName =new String((request.getParameter("petName").getBytes("ISO-8859-1")), "utf-8");//解决网页输入的乱码问题
		String realName = new String((request.getParameter("realName").getBytes("ISO-8859-1")), "utf-8");
		String telphone = request.getParameter("telphone");
	    String id = request.getParameter("ID");
	    String carId = request.getParameter("drivingID");
	    String idType = request.getParameter("carType");
	    
	    
	    //创建userInf对象,并获取userInf.toString();
	    UserInf inf = new UserInf(userName, petName, realName, telphone, id, carId, idType);
	    String userInf = inf.toString();
	    
	    //将userInf保存到cookie中，没个信息之间以“,”隔开。
		try {
			Cookie cookie = new Cookie(userName,URLEncoder.encode(userInf, "utf-8"));
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}

}
