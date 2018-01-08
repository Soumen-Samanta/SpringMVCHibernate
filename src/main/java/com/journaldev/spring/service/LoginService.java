package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.LoginBean;

public interface LoginService {
	public List<LoginBean> getUserLogin(String userName, String password);
}
