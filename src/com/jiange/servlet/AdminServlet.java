package com.jiange.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.model.Admin;
import com.jiange.util.DBHelper;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		
		//存储从数据库中获得的管理员信息。
		String name = "";
		String pass = "";
		
		//获取数据库连接
		DBHelper helper = new DBHelper();
		Connection connection = helper.getConnection();	
		ResultSet resultSet = null;
		
		String sql = "select username,password from t_admin where username = ? and password = ?";
		try {
			PreparedStatement pstat = connection.prepareStatement(sql);
			pstat.setString(1,userName);
			pstat.setString(2,passWord);
			
			resultSet = pstat.executeQuery();
			if(resultSet.next()){
				name = resultSet.getString("username");
				pass = resultSet.getString("password");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				resultSet.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(userName.equals(name)&&passWord.equals(pass)){
			Admin admin = new Admin();
			admin.setPassword(pass);
			admin.setUsername(name);
			request.getSession().setAttribute("admin", admin);
			response.sendRedirect(request.getContextPath()+"/backui/backindex.jsp");
		}
		else {
			String alert = "<span style='color:red;'>该用户不存在</span>";
			request.setAttribute("alert", alert);
			request.getRequestDispatcher("/backui/login.jsp").forward(request, response);;
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
