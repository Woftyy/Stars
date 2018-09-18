package com.stars.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.Forum;
import com.stars.entity.Thread;
import com.stars.mapper.ForumMapper;
import com.stars.mapper.ThreadMapper;
import com.stars.service.ThreadService;

@Service
@Transactional(readOnly=true)
public class ThreadServiceImpl implements ThreadService{

	@Autowired
	private ThreadMapper threadMapper;
	@Autowired
	private ForumMapper forumMapper;
	@Override
	public void add(String name, int uid, String title,String content) {
		// TODO Auto-generated method stub
		Forum forum=forumMapper.getByName(name);
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Thread thread= new Thread();
		thread.setFid(forum.getId());
		thread.setUid(uid);
		thread.setContent(content);
		thread.setTitle(title);
		thread.setTime(time);
		thread.setViews(1);
	    threadMapper.add(thread);
	}
	@Override
	public List<Thread> list() {
		// TODO Auto-generated method stub
		return threadMapper.list();
	}

}
