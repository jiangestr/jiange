package com.jiange.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.jiange.dao.CarDao;
import com.jiange.dao.DaoFactory;
import com.jiange.model.Car;

/**
 * Servlet implementation class json
 */
@WebServlet("/json")
public class json extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public json() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id =	request.getParameter("id");
		
		DaoFactory daoFactory = new DaoFactory();
		daoFactory.openConnection();
		
		CarDao carDao = daoFactory.getCarDao();
		Car car = carDao.selectCar("1");
		
		
		JSONObject object = new JSONObject(car);
		
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println(new String(object.toString().getBytes("utf-8"),"utf-8"));
		writer.flush();
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
