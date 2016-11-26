package com.jiange.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.dao.DaoFactory;
import com.jiange.dao.OrderDao;
import com.jiange.model.Order;
import com.jiange.model.User;

/**
 * Servlet implementation class UserOrderServlet
 */
@WebServlet("/UserOrderServlet")
public class UserOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �������ݿ�����
		DaoFactory daoFactory = new DaoFactory();
		daoFactory.openConnection();
		
		//ͨ��session�б����currentUser����ȡ�û�������ͨ���û�����ȡ�û��Ķ������ϡ�
		OrderDao orderDao = daoFactory.getOrderDao();
		User user =  (User)request.getSession().getAttribute("currentUser");
		String username = user.getUsername();
		ArrayList<Order> allOrders = orderDao.selectOrdersByUsername(username);
		
		//���������ϴ�ŵ�request�У��ύ��ǰ̨
		request.setAttribute("allOrders", allOrders);
		//�ر����ݿ�����
		daoFactory.closeConnection();
		
		request.setAttribute("mainPage", "userui/userorder.jsp");
		request.getRequestDispatcher("/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
