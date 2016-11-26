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
		// ��ʾ�û���Ϣ�ͱ����û���Ϣ
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
		
		//��ȡ���ύ���û���Ϣ
		String userName = ((User)request.getSession().getAttribute("currentUser")).getUsername();
		String petName =new String((request.getParameter("petName").getBytes("ISO-8859-1")), "utf-8");//�����ҳ�������������
		String realName = new String((request.getParameter("realName").getBytes("ISO-8859-1")), "utf-8");
		String telphone = request.getParameter("telphone");
	    String id = request.getParameter("ID");
	    String carId = request.getParameter("drivingID");
	    String idType = request.getParameter("carType");
	    
	    
	    //����userInf����,����ȡuserInf.toString();
	    UserInf inf = new UserInf(userName, petName, realName, telphone, id, carId, idType);
	    String userInf = inf.toString();
	    
	    //��userInf���浽cookie�У�û����Ϣ֮���ԡ�,��������
		try {
			Cookie cookie = new Cookie(userName,URLEncoder.encode(userInf, "utf-8"));
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}

}
