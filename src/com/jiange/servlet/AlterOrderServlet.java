package com.jiange.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.dao.DaoFactory;
import com.jiange.dao.OrderDao;
import com.jiange.model.Car;
import com.jiange.model.Order;

/**
 * Servlet implementation class AlterOrderServlet
 */
@WebServlet("/AlterOrderServlet")
public class AlterOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String mainPage = "";//�趨mainTampҳ���include������   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//����url��������actionѡ����÷���
		String action = request.getParameter("action");
		
		if(action.equals("showOrders")){
			showOrders(request, response);
			request.setAttribute("mainPage", "background/result/alterorder.jsp");
			request.getRequestDispatcher("/background/result/alterorder.jsp").forward(request, response);
		}
		if(action.equals("showOrder")){
			showOrder(request, response);
			request.setAttribute("mainPage", "background/result/alter-order.jsp");
			request.getRequestDispatcher("/background/result/alter-order.jsp").forward(request, response);
		}
		if(action.equals("deleteOrder")){
			if(deleteOrder(request, response)){
				request.setAttribute("mainPage", "background/result/success.jsp");
				request.getRequestDispatcher("/background/result/success.jsp").forward(request, response);
			}
			else {
				request.setAttribute("mainPage", "background/result/false.jsp");
				request.getRequestDispatcher("/background/result/false.jsp").forward(request, response);
			}
		}
		if(action.equals("updateOrder")){
			if(updateOrder(request, response)){
				request.setAttribute(mainPage, "background/result/success.jsp");
				request.getRequestDispatcher("/background/result/success.jsp").forward(request, response);
			}
			else{
				request.setAttribute("mainPage", "background/result/false.jsp");
				request.getRequestDispatcher("/background/result/false.jsp").forward(request, response);
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
	
	/**
	 * ͨ��idɾ������
	 * @param request
	 * @param response
	 * @return
	 */
	private boolean deleteOrder(HttpServletRequest request, HttpServletResponse response){
		boolean flag = false;
		int id = Integer.parseInt(request.getParameter("id"));
		
		//�������ݿ�
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		OrderDao orderDao = dao.getOrderDao();
		if(orderDao.deleteOrder(id)){          //ɾ��������
			flag = true;
		}      
		return flag;
	}
	
	
	/**
	 * ��ʾ���ж���
	 * @param request
	 * @param response
	 */
	private void showOrders(HttpServletRequest request, HttpServletResponse response){
		//�������ݿ�����
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		OrderDao orderDao = dao.getOrderDao();
		
		int limit = 0;
		if(request.getParameter("limit")==null){
			limit = 0;
		}
		
		if(request.getParameter("limit")!=null){
			limit =Integer.parseInt(request.getParameter("limit"));
			if(limit <= 0 ){
				limit = 0;
			}
		}
		ArrayList<Order> orders = orderDao.selectOrders(limit);
		
		//�ر����ݿ�����
		dao.closeConnection();
		
		request.getSession().setAttribute("orders", orders);//�����ȡ�����ж�����Ϣ��
		
	}
	
	/**
	 * ���±�
	 * @param request
	 * @param response
	 * @return
	 */
	private boolean updateOrder(HttpServletRequest request, HttpServletResponse response) {
		boolean flag = false;
		
		
		//�������ݿ�����
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Order order = new Order();
		order.setId(Integer.parseInt(request.getParameter("id")));
		order.setUsername(request.getParameter("username"));
		order.setCarName(request.getParameter("carName"));
		order.setLicense(request.getParameter("license"));
		try {
			date = dateFormat.parse(request.getParameter("time_out"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setPre_cost(Double.parseDouble(request.getParameter("pre_cost")));
		order.setTime_out(date);
		try {
			date = dateFormat.parse(request.getParameter("time_in"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setTime_in(date);
		try {
			date = dateFormat.parse(request.getParameter("real_time_in"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setReal_time_in(date);
		order.setReal_cost(Double.parseDouble(request.getParameter("real_cost")));
		
		OrderDao orderDao = dao.getOrderDao();
		if(orderDao.updateOrder(order)){
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * ͨ��id����order
	 * @param request
	 * @param response
	 */
	private void showOrder(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		//�������ݿ�����
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		OrderDao orderDao = dao.getOrderDao();
		Order order = orderDao.selectOrder(id);
		
		dao.closeConnection();
		
		request.setAttribute("order", order);
	}
}
