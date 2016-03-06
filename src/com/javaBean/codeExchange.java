package com.javaBean;
//编码转换器
public class codeExchange {
	public String ChineseCoding(String str) {
		if (str == null)
			str = "";
		try {
			str = new String(str.getBytes("ISO-8859-1"), "utf-8");
		} catch (Exception e) {
			str = "";
			e.printStackTrace();
		}
		return str;
	}
}
