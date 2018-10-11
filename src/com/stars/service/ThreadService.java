package com.stars.service;

import java.util.List;

import com.stars.entity.Thread;
import com.stars.entity.User;

public interface ThreadService {

	public void add(String name,int uid,String title,String content);
	
	public List<Thread> list();
	
	public void update(int id,String name,int uid,String title,String content);
	
	public void delete(int id);
	
	public void deleteByUid(int  uid);
	
	public Thread getById(int id);
	
	public Thread getLatestThreadByUid(int uid);
	
	public List<Thread> getListByfid(int fid);
	
	public List<Thread> getMostViewsByfid(int fid);
	
	public List<Thread> getMostReplyNumByfid(int fid);
	
	public List<Thread> getPostByUid(int uid);
	
	public void addReplyNum(int id);
	
	public List<Thread> searchThroughTitleAndContent(String content);

}
