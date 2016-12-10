package com.jiange.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiange.dao.CarDao;
import com.jiange.dao.DaoFactory;
import com.jiange.dao.EvaluateDao;
import com.jiange.model.Car;
import com.jiange.model.Evaluate;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 开启数据库连接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		String id =request.getParameter("id");
		String license = request.getParameter("license");
		
		//获取评论
		EvaluateDao evaluateDao = dao.getEvaluateDao();
		ArrayList<Evaluate> evaluates = evaluateDao.selectEvaluatesByCar(license);
		request.setAttribute("evaluates", evaluates);
		
		//获取车辆信息
		CarDao carDao = dao.getCarDao();
		Car car = carDao.selectCar(id);
		HttpSession session = request.getSession();
		session.setAttribute("car", car);
		
		//使用完，关闭连接
		dao.closeConnection();
		
		request.getRequestDispatcher("/details.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
