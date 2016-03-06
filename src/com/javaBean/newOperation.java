package com.javaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//数据库相关操作
public class newOperation {
	private Connection con = null;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public ResultSet select(String sql) {
		con = new ConOrcl().getCon();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public void update(String sql) {
		con = new ConOrcl().getCon();
		try {
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if (st != null) {
				st.close();
				st = null;
			}
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (con != null) {
				con.close();
				con = null;
				//System.out.println("关闭连接");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public Statement getSt() {
		return st;
	}

	public void setSt(Statement st) {
		this.st = st;
	}

	public PreparedStatement getPs() {
		return ps;
	}

	public void setPs(PreparedStatement ps) {
		this.ps = ps;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}
}