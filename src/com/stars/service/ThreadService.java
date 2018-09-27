package com.stars.service;

import java.util.List;

import com.stars.entity.Thread;

public interface ThreadService {

	public void add(String name,int uid,String title,String content);
	
	public List<Thread> list();
	
	public Thread getById(int id);
	
	public Thread getLatestThreadByUid(int uid);
	
	public List<Thread> getListByfid(int fid);
	
	public List<Thread> getMostViewsByfid(int fid);
	
	public List<Thread> getMostReplyNumByfid(int fid);
	
	public List<Thread> getPostByUid(int uid);
	
	public void addReplyNum(int id);
}
