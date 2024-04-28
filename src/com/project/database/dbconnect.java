package com.project.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class dbconnect {
public static Connection openConnection() {
Connection conn = null;
String dbURL = "jdbc:mysql://localhost:3306/utmholdings";
	//Im not sure which port number is used, since inside the contorllers dr make another connection
	//This is from the xamp mysql port number
String username = "root";
String password = "";
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbURL,username,password);
System.out.println("connection successfully opened from dbconnect");
}catch (SQLException ex) {
ex.printStackTrace();
}catch (ClassNotFoundException ex) {
ex.printStackTrace();
}
return conn;
}
}
