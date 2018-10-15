package com.stars.service;

import java.util.List;

import com.stars.entity.Forum;

public interface ForumService {

	//通过Thread fid 获取Forum
		public List<Forum> getforumByThreadFid();
		
		public Forum getById(int id);
		
		public void update(Forum forum);
}
