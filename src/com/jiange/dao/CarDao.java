package com.jiange.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.jiange.model.Car;

public class CarDao {
	private Connection conn;
	private PreparedStatement pstat;
	

	// 构造方法调用getConnection()方法
	public CarDao(Connection conn) {		
		this.conn = conn;
	}
	
	
	/**
	 * 按照租用次数排名，查询排行前十的车辆。
	 * @return
	 */
	public ArrayList<Car> selectCarsRanking() {
		ArrayList<Car> cars = new ArrayList<Car>();
		String sql = "select car.id,name,type,license,ride,lode,picture,price,times from t_car as car inner join"
				+ " t_car_type as type  order by car.times desc limit 0,10 ";
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet result = pstat.executeQuery();
			
			try {
				while (result.next()) {
					Car car = new Car();
					car.setId(result.getInt(1));
					car.setName(result.getString(2));
					car.setType(result.getString(3));
					car.setLicense(result.getString(4));
					car.setRide(result.getInt(5));
					car.setLoad(result.getInt(6));
					car.setPicture(result.getString(7));
					car.setPrice(result.getDouble(8));
					car.setTimes(result.getInt(9));
					cars.add(car);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cars;
	}

	/**
	 * 根据汽车类别查询车辆
	 * @param limit
	 * @param carType
	 * @return
	 */
	public ArrayList<Car> selectAllCars(int limit,int carType) {
		ArrayList<Car> cars = new ArrayList<Car>();
		String sql = "select car.id,name,type,license,ride,lode,picture,price from t_car as car inner join"
				+ " t_car_type as type on car.type_id = type.id and type.id = ?  order by car.id asc limit ?,? ";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, carType);
			pstat.setInt(2, limit);
			pstat.setInt(3, limit+10);
			ResultSet result = pstat.executeQuery();
			
			try {
				while (result.next()) {
					Car car = new Car();
					car.setId(result.getInt(1));
					car.setName(result.getString(2));
					car.setType(result.getString(3));
					car.setLicense(result.getString(4));
					car.setRide(result.getInt(5));
					car.setLoad(result.getInt(6));
					car.setPicture(result.getString(7));
					car.setPrice(result.getDouble(8));
					cars.add(car);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cars;
	}

	/**
	 * 查询所有车辆的信息。
	 * 
	 * @return ArrayList<car>
	 */
	public ArrayList<Car> selectAllCars(int limit) {
		ArrayList<Car> cars = new ArrayList<Car>();
		String sql = "select car.id,name,type,license,ride,lode,picture,price from t_car as car left join"
				+ " t_car_type as type on car.type_id = type.id  order by car.id asc limit ?,? ";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, limit);
			pstat.setInt(2, limit+10);
			ResultSet result = pstat.executeQuery();
			
			try {
				while (result.next()) {
					Car car = new Car();
					car.setId(result.getInt(1));
					car.setName(result.getString(2));
					car.setType(result.getString(3));
					car.setLicense(result.getString(4));
					car.setRide(result.getInt(5));
					car.setLoad(result.getInt(6));
					car.setPicture(result.getString(7));
					car.setPrice(result.getDouble(8));
					cars.add(car);
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cars;
	}
	
	/**
	 * 根据id查看车辆
	 * @param id
	 * @return
	 */
	public Car selectCar(String id) {
		Car car = new Car();
		String sql = "select car.id,name,type,license,ride,lode,picture,price from t_car as car inner join"
				+ " t_car_type as type on car.type_id = type.id and car.id="+id;
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet result = pstat.executeQuery();
			
			try {
				while (result.next()) {
					
					car.setId(result.getInt(1));
					car.setName(result.getString(2));
					car.setType(result.getString(3));
					car.setLicense(result.getString(4));
					car.setRide(result.getInt(5));
					car.setLoad(result.getInt(6));
					car.setPicture(result.getString(7));
					car.setPrice(result.getDouble(8));
					
				}
			} finally {
				result.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return car;
	}
	
	/**
	 * 批量添加车辆信息。
	 * @param cars
	 * @return true/false
	 */
	public boolean insertCars(Car car){
		boolean flag = false;
		String sql = "insert t_car set name = ? ,type_id = (select id from t_car_type where type = ?) ,"+ 
				"license = ? ,ride = ? , lode = ?,picture = ?, price = ?";
		
			try {
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, car.getName());
				pstat.setString(2, car.getType());
				pstat.setString(3, car.getLicense());
				pstat.setInt(4, car.getRide());
				pstat.setInt(5, car.getLoad());
				pstat.setString(6, car.getPicture());
				pstat.setDouble(7, car.getPrice());
				
				pstat.executeUpdate();
				
				
			} catch (SQLException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
			flag = true;
		
		return flag;
	}
	
	/**
	 * 通过参数id删除指定car
	 * @param id
	 * @return
	 */
	public boolean deleteCars(String id){
		boolean flag = false;
		String sql = "delete from t_car where id = "+ id;
		
			try {
				pstat = conn.prepareStatement(sql);
				pstat.executeUpdate();
				flag = true;
				
			} catch (SQLException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return flag;
	}
	
	
	
	/**
	 * 更新车辆信息。
	 * @param car
	 * @return
	 */
	public boolean updateCar (Car car){
		boolean flag = false;
		String sql = "update t_car set name = ? ,type_id = (select id from t_car_type where type = ?) ,"+ 
			"license = ? ,ride = ? , lode = ?,picture = ?, price = ? where id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, car.getName());
			pstat.setString(2, car.getType());
			pstat.setString(3, car.getLicense());
			pstat.setInt(4, car.getRide());
			pstat.setInt(5, car.getLoad());
			pstat.setString(6, car.getPicture());
			pstat.setDouble(7, car.getPrice());
			pstat.setInt(8, car.getId());
			
			pstat.executeUpdate();
			flag = true;
			
			
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	

	// 测试方法
/*	public static void main(String[] args) {
		CarDao dao = new CarDao();
		ArrayList<Car> cars = new ArrayList<Car>();
		Car car1 = new Car();
		car1.setId(3);
		car1.setName("牛逼");
		car1.setLicense("ssd33");
		car1.setType("客车");
		car1.setRide(1212);
		car1.setLoad(322);
		car1.setPicture("ddddd");
		car1.setPrice(212);
		cars.add(car1);
		
		Car car2 = new Car();
		car2.setName("ww");
		car2.setLicense("ssds");
		car2.setType("轿车");
		car2.setRide(1212);
		car2.setLoad(322);
		car2.setPicture("dddsa");
		car2.setPrice(22);
		cars.add(car2);
		
		dao.updateCar(car1);
	}*/
}
