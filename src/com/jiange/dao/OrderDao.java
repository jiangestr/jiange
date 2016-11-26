package com.jiange.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.jiange.model.Order;

public class OrderDao {
	private Connection conn;
	private PreparedStatement pstat;

	// ���췽������getConnection()����
	public OrderDao(Connection conn) {		
		this.conn = conn;
	}

	
	/**
	 * ��ԃָ���û��Ķ�����
	 * @param username
	 * @return
	 */
	 public ArrayList<Order> selectOrdersByUsername (String username) {
		ArrayList<Order>  orders = new ArrayList<Order>();
		Timestamp ts;
		long time;
		String sql = "select t_order.id,username,name,license,time_out,days,pre_cost,time_in,real_time_in,real_cost from t_order,t_car,t_user"+
		" where t_order.user_id = t_user.id and t_order.car_id = t_car.id and username =? group by time_in ";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, username);
			ResultSet result = pstat.executeQuery();
			try {
				while (result.next()) {
					Order order = new Order();
					order.setId(result.getInt(1));
					order.setUsername(result.getString(2));
					order.setCarName(result.getString(3));
					order.setLicense(result.getString(4));
					ts = result.getTimestamp(5);
					time = ts.getTime();
					order.setTime_out(new Date(time));
					order.setDays(result.getInt(6));
					order.setPre_cost(result.getDouble(7));
					ts = result.getTimestamp(8);
					time = ts.getTime();
					order.setTime_in(new Date(time));
					ts = result.getTimestamp(9);
					//���������δ������ʵ�ʻ���ʱ�䲻��ֵ��
					if(ts != null){
						time = ts.getTime();
						order.setReal_time_in(new Date(time));
					}
					
					//���ʵ�ʼ۸�Ϊ0���Ͳ���ֵ
					if(result.getDouble(10) != 0){
						order.setReal_cost(result.getDouble(10));
					}
					//��Order���뼯����
					orders.add(order);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	 
	 public Order selectOrder(int id){
		 Order order = new Order();
		 String sql = "select t_order.id,username,name,license,time_out,days,pre_cost,time_in,real_time_in,real_cost from t_order,t_car,t_user"+
		" where t_order.user_id = t_user.id and t_order.car_id = t_car.id and t_order.id=?";
		 Timestamp ts;
		 long time;
		 try {
				pstat = conn.prepareStatement(sql);
				pstat.setInt(1, id);
				ResultSet result = pstat.executeQuery();
				try {
					while (result.next()) {
						order.setId(result.getInt(1));
						order.setUsername(result.getString(2));
						order.setCarName(result.getString(3));
						order.setLicense(result.getString(4));
						ts = result.getTimestamp(5);
						time = ts.getTime();
						order.setTime_out(new Date(time));
						order.setDays(result.getInt(6));
						order.setPre_cost(result.getDouble(7));
						ts = result.getTimestamp(8);
						time = ts.getTime();
						order.setTime_in(new Date(time));
						ts = result.getTimestamp(9);
						
						//���������δ������ʵ�ʻ���ʱ�䲻��ֵ��
						if(ts != null){
							time = ts.getTime();
							order.setReal_time_in(new Date(time));
						}
						
						//���ʵ�ʼ۸�Ϊ0���Ͳ���ֵ
						if(result.getDouble(10) != 0){
							order.setReal_cost(result.getDouble(10));
						}
						
					}
				} finally {
					result.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return order;
	 }
	
	/**
	 * ����Ա��ѯ���пͻ��Ķ�����Ϣ��
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<Order> selectOrders (int limit) {
		ArrayList<Order>  orders = new ArrayList<Order>();
		Timestamp ts;
		long time;
		String sql = "select ss.id,username,name,license,time_out,days,pre_cost,time_in,real_time_in,real_cost from (select t_order.id,username,car_id,time_out,days,pre_cost,time_in,real_time_in,real_cost from t_order left join t_user on t_order.user_id = t_user.id) as ss left join t_car on ss.car_id = t_car.id group by time_in order by ss.id asc limit ?,?";
		try {
			pstat = conn.prepareStatement(sql, ResultSet.TYPE_FORWARD_ONLY,
											   ResultSet.CONCUR_READ_ONLY ,
											   ResultSet.CLOSE_CURSORS_AT_COMMIT );
			pstat.setInt(1, limit);
			pstat.setInt(2, limit+100);
			
			ResultSet result = pstat.executeQuery();
			try {
				while (result.next()) {
					Order order = new Order();
					order.setId(result.getInt(1));
					order.setUsername(result.getString(2));
					order.setCarName(result.getString(3));
					order.setLicense(result.getString(4));
					ts = result.getTimestamp(5);
					time = ts.getTime();
					order.setTime_out(new Date(time));
					order.setDays(result.getInt(6));
					order.setPre_cost(result.getDouble(7));
					ts = result.getTimestamp(8);
					time = ts.getTime();
					order.setTime_in(new Date(time));
					ts = result.getTimestamp(9);
					
					//���������δ������ʵ�ʻ���ʱ�䲻��ֵ��
					if(ts != null){
						time = ts.getTime();
						order.setReal_time_in(new Date(time));
					}
					
					//���ʵ�ʼ۸�Ϊ0���Ͳ���ֵ
					if(result.getDouble(10) != 0){
						order.setReal_cost(result.getDouble(10));
						
					}
					orders.add(order);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	
	/**�û��ύ������Ϣ������Ϊ�����еĳ����ı�����������1.
	 * @param order
	 * @return boolean
	 */
	public boolean insertOder (Order order){
		boolean flag = false;
		Date date;
		String sql = "insert t_order set id = default,user_id = (select id from t_user where username= ?)"+
		",car_id = (select id from t_car where license =? ),time_out = ?,days = ?,time_in = ?, real_time_in = ?"+
		",pre_cost = ?,real_cost =?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, order.getUsername());
			pstat.setString(2, order.getLicense());
			date = order.getTime_out();
			pstat.setTimestamp(3, new Timestamp(date.getTime()));
			pstat.setInt(4, order.getDays());
			
			date = order.getTime_in();
			pstat.setTimestamp(5, new Timestamp(date.getTime()));
			
			date = order.getReal_time_in();
			if(date != null){
				pstat.setTimestamp(6, new Timestamp(date.getTime()));
			}else{
				pstat.setTimestamp(6, null);
			}
			
			pstat.setDouble(7, order.getPre_cost());
			pstat.setDouble(8, order.getReal_cost());
			pstat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//���ݶ����г�����id��t_car���г��������õĴ�����1.
		sql = "update t_car set times = times+1 where t_car.license=?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, order.getLicense());
			pstat.setString(2, order.getLicense());
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return flag;
	}
	
	/**
	 * ɾ�����ݿ��еĶ�����Ϣ��
	 * @param id
	 * @return boolean
	 */
	public boolean deleteOrder(int id){
		boolean flag = false;
		String sql = "delete from t_order where id =?";
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
	
	
	/**
	 * ����Order��Ϣ
	 * @param order
	 * @return
	 */
	public boolean updateOrder(Order order){
		boolean flag = false;
		String sql = "update t_order set days = ?,time_in = ?pre_cost = ?,real_time_in = ?,real_cost = ? where id = ?";
		Date ts = new Date() ;
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1,order.getDays() );
			ts = order.getTime_in();
			pstat.setTimestamp(2, new Timestamp(ts.getTime()));
			pstat.setDouble(3, order.getPre_cost());
			ts = order.getReal_time_in();
			pstat.setTimestamp(4, new Timestamp(ts.getTime()));
			pstat.setDouble(5, order.getReal_cost());
			pstat.setInt(6, order.getId());
			pstat.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
}
