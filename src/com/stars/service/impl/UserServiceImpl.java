package com.stars.service.impl;

import java.sql.Timestamp;

import org.omg.CORBA.UShortSeqHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.User;
import com.stars.mapper.UserMapper;
import com.stars.service.UserService;

@Service
@Transactional(readOnly=true)
public class UserServiceImpl implements UserService{
	@Autowired
    private  UserMapper userMapper;
	@Override
	public void doRegister(String name, String password, String sex, String email) {
		// TODO Auto-generated method stub
		User user =new User();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setName(name);
		user.setPassword(password);
		user.setSex(sex);
		user.setEmail(email);
		user.setTime(time);
		userMapper.add(user);
	}
	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		if(userMapper.checkName(name)) {
			return true;
		}
		return false;
	}



}
