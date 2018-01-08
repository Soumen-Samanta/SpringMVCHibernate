package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.journaldev.spring.model.LoginBean;
import com.journaldev.spring.model.Person;

public class LoginDAOImpl implements LoginDAO{
private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	public List<LoginBean> getUserLogin(String userName, String password){
		Session session = this.sessionFactory.getCurrentSession();	
		Query q=session.createQuery("from LoginBean as l where l.userName=:n and l.password=:i");  
		q.setParameter("n",userName);  
		q.setParameter("i",password);
		List<LoginBean> loginbean=q.list();
	//	LoginBean p = (LoginBean) session.load(Person.class, new Integer(id));
		//logger.info("Person loaded successfully, Person details="+p);
		return loginbean;
	}
}
