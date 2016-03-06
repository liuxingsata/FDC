package com.javaBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class requestShow {
	private String sql;
	

	public List<requestBean> rlist() {
		List<requestBean> rlist = new ArrayList<requestBean>();
		newOperation nop = new newOperation();
		sql = "select * from request";
		System.out.println(sql);
		ResultSet sqlRst = nop.select(sql);
		try {
			while (sqlRst.next()) {
				requestBean rb = new requestBean();
				rb.setId(sqlRst.getString(1));
				rb.setUsername(sqlRst.getString(2));
				rb.setHouseid(sqlRst.getString(3));
				rb.setApplytype(sqlRst.getString(4));

				rlist.add(rb);
			}
			sqlRst.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		nop.close();
		return rlist;
	}
}
