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
		user.setSrc("/photo_test01.jpg");
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
	/* 
	 *获取对应主题评论的所有用户
	 */
	@Override
	public List<User> UserFromReplyThreadUid(int tid) {
		// TODO Auto-generated method stub
		List<ReplyThread> replyThreads = replyThreadMapper.getReplyThreadBytid(tid);
		ReplyThread replyThread = new ReplyThread();
		List<User> users = new ArrayList<>();
       for(int i=0; i<replyThreads.size(); i++) {
    	   replyThread = replyThreads.get(i);
    	   User user =userMapper.get(replyThread.getFromUid());
    	   users.add(user);
       }
		return users;
	}
	/* 获取对应主题的评论主题用户
	 * 
	 */
	@Override
	public List<User> UserFromReviewsfromUid(int tid) {
		// TODO Auto-generated method stub
		List<ReplyThread> ReviewList = replyThreadMapper.getReviewList(tid);
		ReplyThread replyThread = new ReplyThread();
		List<User> users = new ArrayList<>();
       for(int i=0; i<ReviewList.size(); i++) {
    	   replyThread = ReviewList.get(i);
    	   User user =userMapper.get(replyThread.getFromUid());
    	   users.add(user);
       }
		return users;
	}
	/* 
	 * 获取对应主题的回复用户的用户
	 */
	@Override
	public List<User> UserFromReplyfromUid(int tid) {
		// TODO Auto-generated method stub
		List<ReplyThread> ReplyList = replyThreadMapper.getReplyList(tid);
		ReplyThread replyThread = new ReplyThread();
		List<User> users = new ArrayList<>();
       for(int i=0; i<ReplyList.size(); i++) {
    	   replyThread = ReplyList.get(i);
    	   User user =userMapper.get(replyThread.getFromUid());
    	   users.add(user);
       }
		return users;
	}
	
	/* 
	 * 	获取对应主题被回复的用户
	 */
	@Override
	public List<User> UserFromReplytoUid(int tid) {
		// TODO Auto-generated method stub
		System.out.println("访问了UserFromReplytoUid");
		List<ReplyThread> ReplyList = replyThreadMapper.getReplyList(tid);
		ReplyThread replyThread = new ReplyThread();
		List<User> users = new ArrayList<>();
       for(int i=0; i<ReplyList.size(); i++) {
    	   replyThread = ReplyList.get(i);
    	   User user =userMapper.get(replyThread.getToUid());
    	   users.add(user);
       }
		return users;
	}
	/* (non-Javadoc)
	 * @see com.stars.service.UserService#updateProfile(com.stars.entity.User)
	 */
	@Override
	public void updateProfile(User user) {
		// TODO Auto-generated method stub
		userMapper.updateProfile(user);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.UserService#list()
	 */
	@Override
	public List<User> list() {
		// TODO Auto-generated method stub
		return userMapper.list();
	}
	/* (non-Javadoc)
	 * @see com.stars.service.UserService#delete(int)
	 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		userMapper.delete(id);
	}



}
