package com.javaBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userShow {

	private String tablename;
	private String sql;
	private String username;
	private String value = "";

	public String getSql() {
		return sql;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public List<userBean> userlist() {
		List<userBean> userlist = new ArrayList<userBean>();
		newOperation nop = new newOperation();
		if (username == null) {
			sql = "select * from " + tablename;
		} else {
			sql = "select * from " + tablename + " where " + username + "='" + value + "'";
		}
		System.out.println(sql);
		ResultSet sqlRst = nop.select(sql);
		try {
			while (sqlRst.next()) {
				userBean hb = new userBean();
				hb.setId(sqlRst.getString(1));
				hb.setUsername(sqlRst.getString(2));
				hb.setPassword(sqlRst.getString(3));
				hb.setTruename(sqlRst.getString(4));
				hb.setSex(sqlRst.getString(5));
				hb.setPhonenumber(sqlRst.getString(6));
				hb.setEmail(sqlRst.getString(7));
				userlist.add(hb);
			}
			sqlRst.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		nop.close();
		return userlist;
	}
}
