package com.javaBean;

public class userBean {
	private String id;
	private String username;
	private String password;
	private String passwordcon;
	private String truename;
	private String sex;
	private String phonenumber;
	private String email;
	private String returnmsg;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordcon() {
		return passwordcon;
	}

	public void setPasswordcon(String passwordcon) {
		this.passwordcon = passwordcon;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getReturnmsg() {
		return returnmsg;
	}

	public void setReturnmsg(String returnmsg) {
		this.returnmsg = returnmsg;
	}

	public String check() {
		if (username.equals("")) {
			returnmsg = returnmsg + "01";
		}
		if (truename.equals("")) {
			returnmsg = returnmsg + "02";
		}
		if (password.length() < 1) {
			returnmsg = returnmsg + "密码不可为空！";
		}
		if (!password.equals(passwordcon)) {
			returnmsg = returnmsg + "04";
		}
		return returnmsg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
