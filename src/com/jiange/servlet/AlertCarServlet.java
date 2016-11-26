package com.jiange.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiange.dao.CarDao;
import com.jiange.dao.DaoFactory;
import com.jiange.model.Car;

/**
 * Servlet implementation class AlertCarServlet
 */
@WebServlet("/AlertCarServlet")
public class AlertCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String mainPage = "";//设定mainTamp页面的include里内容
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlertCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		//通过request里的action确定调用方法
		if(action.equals("showadd")){
			showCar(request, response);
			request.setAttribute("mainPage", "result/addcar.jsp");
			request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
		}
		
		if(action.equals("showCar")){
			showCar(request, response);
			request.setAttribute("mainPage", "result/alter-cars.jsp");
			request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
		}
		
		if(action.equals("showCars")){
			showCars(request, response);
			request.setAttribute("mainPage", "result/alertcar.jsp");
			request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
		}
		if(action.equals("addCar")){
			if(addCar(request, response)){
				request.setAttribute("mainPage", "result/success.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
			}
			else{
				request.setAttribute("mainPage", "result/false.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
			}
		}
		if(action.equals("deleteCar")){
			if(deleteCar(request, response)){
				request.setAttribute("mainPage", "result/success.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
			}
			else{
				request.setAttribute("mainPage", "result/false.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
			}
		}
		if(action.equals("updateCar")){
			if(updateCar(request, response)){
				request.setAttribute("mainPage", "result/success.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
			}
			else{
				request.setAttribute("mainPage", "result/false.jsp");
				request.getRequestDispatcher("/background/mainTamp.jsp").forward(request, response);
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
	
	//通过id显示单个
	private void showCar(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		System.out.println(id);
		
		//开启数据库链接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		CarDao carDao = dao.getCarDao();
		Car car = new Car();
		car = carDao.selectCar(id);
		//使用完，关闭数据库连接。
		dao.closeConnection();
		
		HttpSession session = request.getSession();
		session.setAttribute("car", car);
	}
	
	
	//显示所有cars;
	private void showCars(HttpServletRequest request, HttpServletResponse response){
		//开启数据库链接
				DaoFactory dao = new DaoFactory();
				dao.openConnection();
				
				CarDao carDao = dao.getCarDao();
				ArrayList<Car> cars = new ArrayList<Car>();
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
				
				cars = carDao.selectAllCars(limit);
				//使用完，关闭数据库连接。
				dao.closeConnection();
				
				HttpSession session = request.getSession();
				session.setAttribute("cars", cars);
	}
	
	//添加car
	private boolean addCar(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		// 将表单提交的数据存储到car对象中去
		Car car = new Car();
		
		car.setName(new String((request.getParameter("name").getBytes("ISO-8859-1")), "utf-8"));//解决网页输入的乱码问题
		car.setLicense(request.getParameter("license"));
		car.setLoad(Integer.parseInt(request.getParameter("load")));
		car.setPicture(request.getParameter("picture"));
		car.setPrice(Double.valueOf(request.getParameter("price")));
		car.setRide(Integer.parseInt(request.getParameter("ride")));
		car.setType(new String(request.getParameter("type").getBytes("ISO-8859-1"), "utf-8"));
		boolean flag = false;
		// 获取数据库连接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();

		CarDao carDao = dao.getCarDao();
		if (carDao.insertCars(car)) {
			flag = true;
		}
		dao.closeConnection();

		return flag;

	}
	
	
	//修改car的数据。
	private boolean updateCar(HttpServletRequest request, HttpServletResponse response){
		//将表单提交的数据存储到car对象中去
		Car car =new Car();
		car.setId(Integer.parseInt(request.getParameter("id")));
		car.setName(request.getParameter("name"));
		car.setLicense(request.getParameter("license"));
		car.setLoad(Integer.parseInt(request.getParameter("load")));
		car.setPicture(request.getParameter("picture"));
		car.setPrice(Double.valueOf(request.getParameter("price")));
		car.setRide(Integer.parseInt(request.getParameter("ride")));
		car.setType(request.getParameter("type"));
		
		boolean flag = false;
		//获取数据库连接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		CarDao carDao = dao.getCarDao();
		if(carDao.updateCar(car)){
			flag = true;
		}
		dao.closeConnection();
		
		return flag;
	}
	
	
	//删除car的数据。
	private boolean deleteCar(HttpServletRequest request, HttpServletResponse response){
		//获取request中id属性。
		String id = request.getParameter("id");
		
		boolean flag = false;
		//获取数据库链接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		CarDao carDao = dao.getCarDao();
		if(carDao.deleteCars(id)){
			flag = true;
		}
		dao.closeConnection();//关闭连接
		
		return flag;
	}
	
	

}
