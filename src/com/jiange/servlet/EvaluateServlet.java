package com.jiange.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiange.dao.DaoFactory;
import com.jiange.dao.EvaluateDao;
import com.jiange.model.Evaluate;
import com.jiange.model.User;

/**
 * Servlet implementation class EvaluateServlet
 */
@WebServlet("/EvaluateServlet")
public class EvaluateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String mainPage = null;
		if(action.equals("insert")){
			if(insert(request, response)){
				mainPage = "userui/success.jsp";
				request.setAttribute("mainPage", mainPage);
				request.getRequestDispatcher("/user.jsp").forward(request, response);
			}
			else{
				mainPage = "userui/false.jsp";
				request.setAttribute("mainPage", mainPage);
				request.getRequestDispatcher("/user.jsp").forward(request, response);
			}
		}
		
		if(action.equals("showPage")){
			mainPage = "userui/evaluate.jsp";
			request.setAttribute("mainPage", mainPage);
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
	
	/**
	 * 向数据库中插入评论
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	private boolean insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从前台获取参数封装到Evaluate对象中去
		String context = request.getParameter("context");
		User user  = ((User)request.getSession().getAttribute("currentUser"));
		String username = user.getUsername();
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		String license = request.getParameter("license");
		Evaluate evaluate2 = new Evaluate();
		evaluate2.setOrderId(orderId);
		evaluate2.setUsername(username);
		evaluate2.setContext(context);
		evaluate2.setLicense(license);
		
		//获取数据库连接
		DaoFactory dao = new DaoFactory();
		dao.openConnection();
		
		EvaluateDao evaluateDao = dao.getEvaluateDao();
		if(evaluateDao.insertEvaluate(evaluate2)){
			dao.closeConnection();
			return true;
		}
		dao.closeConnection();
		return false;
	}

}
