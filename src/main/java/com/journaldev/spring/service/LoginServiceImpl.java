package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.LoginDAO;
import com.journaldev.spring.model.LoginBean;

@Service
public class LoginServiceImpl implements LoginService{
private LoginDAO loginDao;

public void setLoginDao(LoginDAO loginDao) {
	this.loginDao = loginDao;
}
@Override
@Transactional

public List<LoginBean> getUserLogin(String userName, String password){
	return this.loginDao.getUserLogin(userName, password);
}
}
