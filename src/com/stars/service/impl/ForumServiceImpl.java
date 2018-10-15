package com.stars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.Forum;
import com.stars.mapper.ForumMapper;
import com.stars.service.ForumService;

@Service
@Transactional(readOnly=true)
public class ForumServiceImpl implements ForumService{

	@Autowired
	private ForumMapper forumMapper;
	@Override
	public List<Forum> getforumByThreadFid() {
		// TODO Auto-generated method stub
		return forumMapper.getForumByThreadFid();
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ForumService#getById(int)
	 */
	@Override
	public Forum getById(int id) {
		// TODO Auto-generated method stub
		return forumMapper.getById(id);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ForumService#update(com.stars.entity.Forum)
	 */
	@Override
	public void update(Forum forum) {
		// TODO Auto-generated method stub
		forumMapper.update(forum);
	}

	
}
