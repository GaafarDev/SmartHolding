package com.project.database;

//Used for Spring JDBCTemplate

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class RentalDao {
//JDBC Template
JdbcTemplate jdbc = new JdbcTemplate(getDataSource());

//FUnction for query
public List<Rental> getAllRental(){
	String sql = "SELECT * FROM rental";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getTenantRental(int tenantId){
	String sql = "SELECT * FROM rental where tenantId ='"+tenantId+"' ORDER BY rentalDate ASC";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getFutureTenantRental(int tenantId){
	//ignroe past rental
	String sql = "SELECT * FROM rental where tenantId ='"+tenantId+"' AND rentalDateEnd > CURDATE()";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getFutureRental(){
	//ignroe past rental
	String sql = "SELECT * FROM rental where rentalDateEnd > CURDATE()";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getRoomRental(int roomId){

	String sql = "SELECT * FROM rental where roomId ='"+roomId+"'";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getOngoingRoomRental(int roomId){

	String sql = "SELECT * FROM rental WHERE roomId = '" + roomId + "' AND CURDATE() BETWEEN rentalDate AND rentalDateEnd";
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

public List<Rental> getOngoingRentalFromRentalId(int rentalId){

	String sql = "SELECT * FROM rental WHERE rentalId = " + rentalId;
	List<Rental> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Rental>(Rental.class));
	return ls;
}

//Function for Adding query
public String addRental(String tenantId, String roomId, String rentalDate, String rentalDateEnd ) {
	String sql = "INSERT INTO rental (tenantId, roomId, rentalDate, rentalDateEnd) VALUES ('"+tenantId+"','"+roomId+"','"+rentalDate+"','"+rentalDateEnd+"')";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully added "+rentalDate+" into Rental List";
	
}

//Function for Deleting query
public String deleteAllRental() {
	String sql = "Delete from rental";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully deleted All Rental";
}

//Function for Deleting query
public String deleteThisRental(int rentalId) {
	String sql = "Delete from rental where rentalId ="+rentalId;
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully deleted This Rental";
}

//Datasource
public DataSource getDataSource() {
	DataSource ds = null;
	String dbURL = "jdbc:mysql://localhost:3306/utmholdings";
	String username = "root";
	String password = "";
	try {
	Class.forName("com.mysql.jdbc.Driver");
	}catch (ClassNotFoundException ex) {
	ex.printStackTrace();
	}
	ds = new DriverManagerDataSource(dbURL,username,password);
	return ds;
	}
}