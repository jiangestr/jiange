package com.jiange.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	private Connection conn;
	final String url = "jdbc:mysql://127.0.0.1:3306/db_carrent?useUnicode=true&characterEncoding=utf-8";
	final String username = "root";
	final String password = "654321";
	
	/**
	 * 
	 * @获取数据库连接
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(conn==null){
			try {
				conn = DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}
}
