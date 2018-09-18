package com.stars.service;

import java.util.List;

public interface ThreadService {

	public void add(String name,int uid,String title,String content);
	
	public List<com.stars.entity.Thread> list();
}
