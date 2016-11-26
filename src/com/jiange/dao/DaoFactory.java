package com.jiange.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.jiange.util.DBHelper;

public class DaoFactory {
	private Connection conn;



	// �������ݿ�����,�߳����ӷ�Χ
	public void openConnection() {
		DBHelper helper = new DBHelper();
		this.conn = helper.getConnection();
	}

	// �ر����ݿ����ӡ�
	public void closeConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public UserDao getUserDao() {
		UserDao dao = new UserDao(conn);
		return dao;
	}

	public EvaluateDao getEvaluateDao() {
		EvaluateDao dao = new EvaluateDao(conn);
		return dao;
	}

	public CarDao getCarDao() {
		CarDao dao = new CarDao(conn);
		return dao;
	}

	public OrderDao getOrderDao() {
		OrderDao dao = new OrderDao(conn);
		return dao;
	}

	public AccountDao getAccountDao() {
		AccountDao dao = new AccountDao(conn);
		return dao;
	}

}
