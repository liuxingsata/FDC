package com.javaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//数据库连接
public class ConOrcl {
	private String DBDRIVER = "com.mysql.jdbc.Driver";
	private String DBURL = "jdbc:mysql://localhost:3306/FDCsystem2.0?characterEncoding=utf-8";
	private String DBUSER = "root";
	private String DBPASSWORD = "";
	/*
	 * private String DBDRIVER = "oracle.jdbc.driver.OracleDriver"; 
	 * private String DBURL = "jdbc:oracle:thin:@192.168.191.2:1521:orcl?characterEncoding=utf-8";
	 * private String DBUSER = "scott"; 
	 * private String DBPASSWORD="222222";
	 */
	private Connection con = null;

	public ConOrcl() {
		try {
			Class.forName(DBDRIVER).newInstance();
		} catch (Exception e) {
			System.out.println("驱动加载失败");
		}

	}

	public Connection getCon() {
		try {
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("连接成功");
		return con;
	}

}
