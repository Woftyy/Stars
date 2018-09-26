package com.stars.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.UShortSeqHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.ReplyThread;
import com.stars.entity.User;
import com.stars.mapper.ReplyThreadMapper;
import com.stars.mapper.UserMapper;
import com.stars.service.UserService;

@Service
@Transactional(readOnly=true)
public class UserServiceImpl implements UserService{
	@Autowired
    private  UserMapper userMapper;
	@Autowired
	private ReplyThreadMapper replyThreadMapper;
	@Override
	public void doRegister(String name, String password, String sex, String email) {
		// TODO Auto-generated method stub
		User user =new User();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setName(name);
		user.setNickname("用户"+String.valueOf((int)(Math.random()*10000000)));
		user.setPassword(password);
		user.setSex(sex);
		user.setEmail(email);
		user.setTime(time);
		user.setSrc("a");
		userMapper.add(user);
	}
	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		if(userMapper.checkName(name)==null) {
			return false;
		}else {
			return true;
		}
	}
	@Override
	public boolean checkLogin(String name, String password) {
		// TODO Auto-generated method stub
		if(userMapper.checkName(name)!=null) {
			User user =userMapper.getUserByName(name);
			if (user.getPassword().equals(password)) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		return userMapper.getUserByName(name);
	}
	@Override
	public List<User> getUserByThreadUid() {
		// TODO Auto-generated method stub
		return userMapper.getUserByThreadUid();
	}
	@Override
	public User getById(int id) {
		// TODO Auto-generated method stub
		return userMapper.get(id);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.UserService#UserFromReplyThreadUid(int)
	 */
	@Override
	public List<User> UserFromReplyThreadUid(int tid) {
		// TODO Auto-generated method stub
		List<ReplyThread> replyThreads = replyThreadMapper.getReplyThreadBytid(tid);
		ReplyThread replyThread = new ReplyThread();
		List<User> users = new ArrayList<>();
       for(int i=0; i<replyThreads.size(); i++) {
    	   replyThread = replyThreads.get(i);
    	   User user =userMapper.get(replyThread.getUid());
    	   users.add(user);
       }
		return users;
	}
	



}
