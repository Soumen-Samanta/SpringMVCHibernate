package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.LoginBean;

public interface LoginDAO {
	public List<LoginBean> getUserLogin(String userName, String password);
}
