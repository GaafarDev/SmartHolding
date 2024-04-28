package com.project.database;

//Used for Spring JDBCTemplate

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class ManagerDao {
//JDBC Template
JdbcTemplate jdbc = new JdbcTemplate(getDataSource());

//FUnction for query
public List<Manager> getAllManager(){
	String sql = "SELECT * FROM manager";
	List<Manager> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Manager>(Manager.class));
	return ls;
}

//Function for Adding query
public String addManager(String firstName, String lastName, String email, String password) {
	String sql = "INSERT INTO manager (firstName, lastName, email, password) VALUES ('"+firstName+"','"+lastName+"','"+email+"','"+password+"')";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully added "+firstName+" into New Manager List";
	
}

//Function for Deleting query
public String deleteAllManager() {
	String sql = "Delete from manager";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully deleted All manager";
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