package com.jiange.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
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
 * Servlet implementation class CarServlet
 */
@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarServlet() {
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
		//1.ͨ��url�����carType������ѡ��鿴������͵ĳ�����2.��������ʮ������
		int carType = Integer.parseInt(request.getParameter("carType"));
		//�������ݿ�����
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		
		CarDao carDao = dao.getCarDao();
		//���ҳ�
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
		
		cars = carDao.selectAllCars(limit,carType);
		
		//��������ǰʮ
		ArrayList<Car> rankings = carDao.selectCarsRanking();
		
		//ʹ���꣬�ر����ݿ����ӡ�
		dao.closeConnection();
		
		HttpSession session = request.getSession();
		session.setAttribute("cars", cars);
		session.setAttribute("rankings", rankings);
		
		request.getRequestDispatcher("/saloon_car.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
