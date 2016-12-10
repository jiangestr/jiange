package com.jiange.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.jiange.model.Evaluate;

import sun.awt.image.ImageWatched.Link;

public class EvaluateDao {
	
	private Connection conn;
	private PreparedStatement pstat;

	// 构造方法调用getConnection()方法
	public EvaluateDao(Connection conn) {		
		this.conn = conn;
	}
	
	
	/**
	 * 查询所有的用户评论
	 * @return ArrayList<Evaluate>
	 */
	public ArrayList<Evaluate> selectEvaluates(){
		ArrayList<Evaluate> evaluates = new ArrayList<Evaluate>();
		String sql = "select t_user_evaluate.id,username,order_id,context from"+
		"t_user_evaluate,user where t_user.id = user_id";
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet result = pstat.executeQuery();
			try {
				while(result.next()){
					Evaluate evaluate = new Evaluate();
					evaluate.setId(result.getInt(1));
					evaluate.setUsername(result.getString(2));
					evaluate.setOrderId(result.getInt(3));
					evaluate.setContext(result.getString(4));
					evaluates.add(evaluate);
				}
				
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluates;
	}
	
	/**
	 * 通过车Id查看评价
	 * @param id
	 * @return
	 */
	public ArrayList<Evaluate> selectEvaluatesByCar (String license){
		ArrayList<Evaluate> evaluates = new ArrayList<Evaluate>();
		String sql = "select t_user_evaluate.id,username,order_id,"
		+"context,car_license from t_user_evaluate,t_user where "
				+"t_user.id = user_id and car_license=?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, license);
			ResultSet result = pstat.executeQuery();
			try {
				while(result.next()){
					Evaluate evaluate = new Evaluate();
					evaluate.setId(result.getInt(1));
					evaluate.setUsername(result.getString(2));
					evaluate.setOrderId(result.getInt(3));
					evaluate.setContext(result.getString(4));
					evaluate.setLicense(result.getString(5));
					evaluates.add(evaluate);
				}
				
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluates;
	}
	
	/**
	 * 通过订单查看评价，放在订单信息里
	 * @param id
	 * @return
	 */
	public Evaluate selectEvaluatesByOrder (int id){
		Evaluate evaluate = new Evaluate();
		String sql = "select t_user_evaluate.id,username,order_id,context from"+
		"t_user_evaluate,user where t_user.id = user_id and user_id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			ResultSet result = pstat.executeQuery();
			try {
				while(result.next()){
					evaluate.setId(result.getInt(1));
					evaluate.setUsername(result.getString(2));
					evaluate.setOrderId(result.getInt(3));
					evaluate.setContext(result.getString(4));
				}
				
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluate;
	}
	
	/**
	 * 插入订单
	 * @param evaluate
	 * @return
	 */
	public boolean insertEvaluate(Evaluate evaluate){
		boolean flag = false;
		String sql = "insert t_user_evaluate values(null,(select id from t_user where username=?),?,?,?)";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, evaluate.getUsername());
			pstat.setInt(2, evaluate.getOrderId());
			pstat.setString(3,evaluate.getContext());
			pstat.setString(4, evaluate.getLicense());
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 修改评论。
	 * @param id context
	 * @param context
	 * @return boolean
	 */
	public boolean updateEvaluate (int id,String context){
		boolean flag = false;
		String sql = "update t_user_evaluate set context = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, context);
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
		
	/**
	 * 根据评论id删除评论。
	 * @param id
	 * @return
	 */
	public boolean deleteEvaluate (int id){
		boolean flag = false;
		String sql = "delete from t_user_evaluate where id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
	
