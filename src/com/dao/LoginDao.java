package com.dao;

import com.bean.CustomerBean;

public interface LoginDao {
	public CustomerBean Login(String username, String password);
}
