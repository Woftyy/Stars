package com.stars.mapper;

import java.util.List;

import com.stars.entity.Thread;


public interface ThreadMapper {

	public void add(Thread thread);
	
	public void delete(Thread thread);
	
	public Thread getById(int id);
	
	public void update(Thread thread);
	
	public List<Thread> list();
	
	
	  /**通过uid 获取用户最新发布的主题
	 * @param uid
	 * @return
	 */
	public Thread getLatestThreadByUid(int uid);
}
