package com.jiange.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.dao.CarDao;
import com.jiange.dao.DaoFactory;
import com.jiange.dao.OrderDao;
import com.jiange.model.Car;
import com.jiange.model.Order;
import com.jiange.model.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action =(String) request.getParameter("action");
		if(action.equals("creatOrder")){
			if(createOrder(request, response)){
				request.getRequestDispatcher("/order.jsp").forward(request, response);
			}else{
				response.sendRedirect(request.getContextPath()+"index.jsp");
			}
		}
		
		if(action.equals("addOrder")){
			if(addOrder(request, response)){
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}else{
				response.sendRedirect(request.getContextPath()+"/index.jsp");
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
	 * 获取用户输入订单信息，生成订单。
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException
	 */
	private boolean createOrder(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		boolean flag = false;
		
		//连接数据库
		DaoFactory daoFactory = new DaoFactory();
		daoFactory.openConnection();
		
		//查询订单里的车辆信息
		String id = request.getParameter("id");
		CarDao carDao = daoFactory.getCarDao();
		Car car = carDao.selectCar(id);
		
		//获取保存在session的用户信息
		User user = (User) request.getSession().getAttribute("currentUser");
		
		//获取租车日期信息,并计算还车日期信息。
		String[] str = ((String)request.getParameter("time_out")).split("/");
		int days = Integer.parseInt(request.getParameter("days"));
		String dateStr = "" ;
		if(str != null){
			String day = str[0];
			String month = str[1];
			String year = str[2];
			dateStr = year+"-"+ month+"-"+day;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date time_out =null;
		try {
			time_out = dateFormat.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time_out);
		calendar.set(Calendar.DAY_OF_MONTH,calendar.get(Calendar.DAY_OF_MONTH)+days);
		Date time_in = calendar.getTime();
		
		//补全表单信息
		Order order = new Order();
		order.setUsername(new String(user.getUsername().getBytes("ISO-8859-1"), "utf-8"));
		order.setCarName(new String(car.getName().getBytes("ISO-8859-1"), "utf-8"));
		order.setLicense(car.getLicense());
		order.setTime_out(time_out);
		order.setTime_in(time_in);
		order.setDays(days);
		order.setPre_cost(Double.parseDouble(request.getParameter("price")));
		if(order!=null){
			flag = true;
		}
		
		//将订单信息保存在session中返回给客户验证。
		request.getSession().setAttribute("car", car);
		request.getSession().setAttribute("order", order);
		
		return flag;
	}
	
	private boolean addOrder(HttpServletRequest request, HttpServletResponse response){
		boolean flag = false;
		Car car = (Car)request.getSession().getAttribute("car");
		Order order =(Order)request.getSession().getAttribute("order");
		
		//开启数据库连接
		DaoFactory daoFactory = new DaoFactory();
		daoFactory.openConnection();
		OrderDao orderDao = daoFactory.getOrderDao();
		if(orderDao.insertOder(order)){
			flag = true;
		}
		return flag;
	}
}
