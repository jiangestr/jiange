package com.jiange.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.jiange.model.AccountBook;

public class AccountDao {
	private Connection conn;
	private PreparedStatement pstat;
	

	// 构造方法调用getConnection()方法
	public AccountDao(Connection conn) {		
		this.conn = conn;
	}


	
	/**
	 * 插入提供的月份的总营业额。
	 * @param month
	 * @return
	 */
	public boolean insertAccount(int year,int month){
		boolean flag = false;
		String sql = "insert t_account_book id= default,income = (select sum(real_cost) from t_order where month(real_time_in)"
				+ ">=? and month(real_time_in) < ? and year(real_time_in) =?)";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, year+"-"+month);
			pstat.setInt(2, month);
			pstat.setInt(3, month+1);
			pstat.setInt(4, year);
			pstat.executeUpdate();
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 更新账单。
	 * @param year
	 * @param month
	 * @return
	 */
	public boolean updateAccount(int year,int month){
		boolean flag = false;
		String sql = "update t_account_book id= default,date =? ,income = (select sum(real_cost) from t_order where month(real_time_in)"
				+ ">=? and month(real_time_in) < ? and year(real_time_in) =?)";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, year+"-"+month);
			pstat.setInt(2, month);
			pstat.setInt(3, month+1);
			pstat.setInt(4, year);
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 查看所有账单
	 * @return
	 */
	public ArrayList<AccountBook> selectAllAccount(){
		ArrayList<AccountBook> accounts = new ArrayList<AccountBook>();
		String sql ="select * from t_account_book";
		try {
			pstat =conn.prepareStatement(sql);
			ResultSet result = pstat.executeQuery();
			try {
				while(result.next()){
					AccountBook book = new AccountBook();
					book.setId(result.getInt(1));
					book.setDate(result.getString(2));
					book.setIncome(result.getDouble(3));
					accounts.add(book);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return accounts;
	}
}
