package com.javaBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//房屋信息展示
public class houseShow {

	private String tablename;
	private String sql;
	private String username;
	private String value = "";
	private String operation = "=";

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public List<houseBean> houselist() {
		List<houseBean> houselist = new ArrayList<houseBean>();
		newOperation nop = new newOperation();

		if (username == null) {
			sql = "select * from " + tablename;
		} else {
			sql = "select * from " + tablename + " where " + username+" "+ operation+" '" + value + "'";
		}
		System.out.println(sql);
		ResultSet sqlRst = nop.select(sql);
		try {
			while (sqlRst.next()) {
				houseBean hb = new houseBean();
				hb.setId(sqlRst.getString(1));
				hb.setHousetype(sqlRst.getString(2));
				hb.setHousearea(sqlRst.getString(3));
				hb.setHousefloor(sqlRst.getString(4));
				hb.setHouseadd(sqlRst.getString(5));
				hb.setHouseowner(sqlRst.getString(6));
				hb.setHousephoto(sqlRst.getString(7));
				houselist.add(hb);
			}
			sqlRst.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		nop.close();
		return houselist;
	}



}
