package com.javaBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class msgShow {

	private String tablename;
	private String sql;
	private String username;
	private String value = "";

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<msgBean> msglist() {
		List<msgBean> msglist = new ArrayList<msgBean>();
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
				msgBean hb = new msgBean();
				hb.setId(sqlRst.getString(1));
				hb.setMsgdate(sqlRst.getString(3));
				hb.setUsername(sqlRst.getString(2));
				hb.setContent(sqlRst.getString(4));

				msglist.add(hb);
			}
			sqlRst.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		nop.close();
		return msglist;
	}
}
