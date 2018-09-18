package com.stars.mapper;

import java.util.List;

import com.stars.entity.Forum;

public interface ForumMapper {
    
	public void add(Forum forum);
    
	public void delete(Forum forum);
	
	public Forum getById(int id);
	
	public Forum getByName(String name);
	
	public void update(Forum forum);
	
	public List<Forum> list();
}
