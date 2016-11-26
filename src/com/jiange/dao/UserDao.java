package com.jiange.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.jiange.model.User;

public class UserDao {
	private Connection conn;
	private PreparedStatement pstat;
	
	//���췽������getConnection()����
	public UserDao(Connection conn) {		
		this.conn = conn;
	}
	
	
	
	/**
	 * �����û��ĵ�¼��Ϣ�������ݿ���ƥ�����Ϣ�����ھͽ�������ȡ��������ֵ��User���͵Ķ��󣬲����ء������ھͷ���Ϊnull��User����
	 * @param username
	 * @param password
	 * @return boolean����
	 */
	public User selectUser(String username,String password)  {
	
		String sql = "select * from t_user where username = ? and password = ? ";
		User user = null;	
		try {
		    pstat = conn.prepareStatement(sql);
			pstat.setString(1, username);
			pstat.setString(2, password);
			ResultSet result = pstat.executeQuery();
			try {
				if (result.next()) {
					user = new User();
					user.setId(result.getInt("id"));
					user.setUsername(result.getString("username"));
					user.setPassword(result.getString("password"));
					user.setCredit(result.getInt("credit"));
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;		
	}
	
	//�����û���Ϣ��
	public boolean insertUser(User user){
		boolean flag = false;
		String sql = "insert t_user set username = ? , password = ? , credit = ?";
		try {

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user.getUsername());
			pstat.setString(2,user.getPassword());
			pstat.setInt(3, user.getCredit());		
			pstat.executeUpdate();
			flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	/**
	 * �����û���Ϣ�������û��ṩ��user,��password��
	 * @param user
	 * @param password
	 * @return
	 */
	public boolean updateUser(User user,String password){
		boolean flag = false;
		String sql = "update t_user set password = ? where username = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,password);
			pstat.setString(2,user.getUsername());
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * �鿴�����û���Ϣ
	 * @return ArrayList<User>
	 */
	public ArrayList<User> selectAllUser(){
		ArrayList<User> users = new ArrayList<User>(); 
		String sql = "select * from t_user ";
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet result = pstat.executeQuery();
			while(result.next()){
				User user = new User();
				user.setId(result.getInt(1));
				user.setUsername(result.getString(2));
				user.setPassword(result.getString(1));
				user.setCredit(result.getInt(4));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	
	//���Է���
	/*public static void main(String[] args) {
		UserDao ud = new UserDao();
		ArrayList<User> users = ud.selectAllUser();
		Iterator<User> iter = users.iterator();
		while(iter.hasNext()){
			System.out.println(iter.next());
		}
	}*/

}
