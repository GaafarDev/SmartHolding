package com.project.database;

//Used for Spring JDBCTemplate

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class TenantDao {
//JDBC Template
JdbcTemplate jdbc = new JdbcTemplate(getDataSource());

//FUnction for query
public List<Tenant> getAllTenant(){
	String sql = "SELECT * FROM tenant";
	List<Tenant> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Tenant>(Tenant.class));
	return ls;
}

//FUnction for query
public List<Tenant> getTenantFromId(int tenantId){
	String sql = "SELECT * FROM tenant where tenantId = '"+tenantId+"'";
	List<Tenant> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Tenant>(Tenant.class));
	return ls;
}

//Function for Adding query
public String addTenant(String firstName, String lastName, String phone, String email, String password) {
	String sql = "INSERT INTO tenant (firstName, lastName, phone, email, password) VALUES ('"+firstName+"','"+lastName+"','"+phone+"','"+email+"','"+password+"')";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully added "+firstName+" into New Tenant List";
	
}

//Function for Deleting query
public String deleteAllTenant() {
	String sql = "Delete from tenant";
	jdbc.update(sql); //For Update (insert update delte), use .update instead of .query
	
	return "Successfully deleted All tenant";
}

//Get Tenant ID based on email
public int getTenantId(String email) {
	String sql = "SELECT * FROM tenant where email = '"+email+"'";
	List<Tenant> ls = jdbc.query(sql, new BeanPropertyRowMapper 
	<Tenant>(Tenant.class));
	
	return ls.get(0).getTenantId();
	
}

//Update Tenant via whole goddamn object 
public String updateTenantInfo(Tenant tenant) {
	String sql = "UPDATE tenant set firstName = '"+tenant.getFirstName()+"', lastName = '"+tenant.getLastName()+"', phone ='"+tenant.getPhone()+"', email = '"+tenant.getEmail()+"' WHERE tenantId = "+tenant.getTenantId();
	jdbc.update(sql);
	
	return "Tenant Updated";

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