package com.stars.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.Forum;
import com.stars.entity.PageBean;
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
		thread.setViews(0);
		thread.setReplyNum(0);
	    threadMapper.add(thread);
	}
	@Override
	public List<Thread> list() {
		// TODO Auto-generated method stub
		return threadMapper.list();
	}
	@Override
	public Thread getById(int id) {
		// TODO Auto-generated method stub
		return threadMapper.getById(id);
	}
	
	
	
	
	@Override
	public Thread getLatestThreadByUid(int uid) {
		// TODO Auto-generated method stub
		return threadMapper.getLatestThreadByUid(uid);
	}

	@Override
	public List<Thread> getListByfid(int fid) {
		// TODO Auto-generated method stub
		return threadMapper.getListByfid(fid);
	}
	
	@Override
	public List<Thread> getMostViewsByfid(int fid) {
		// TODO Auto-generated method stub
		return threadMapper.getMostViewsByfid(fid);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#getMostReplyNumByfid(int)
	 */
	@Override
	public List<Thread> getMostReplyNumByfid(int fid) {
		// TODO Auto-generated method stub
		return threadMapper.getMostReplyNumByfid(fid);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#getPostByUid(int)
	 */
	@Override
	public List<Thread> getPostByUid(int uid) {
		// TODO Auto-generated method stub
		return threadMapper.getPostByUid(uid);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#addReplyNum(int)
	 */
	@Override
	public void addReplyNum(int id) {
		// TODO Auto-generated method stub
		threadMapper.addReplyNum(id);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#searchThroughTitleAndContent(java.lang.String)
	 */
	@Override
	public List<Thread> searchThroughTitleAndContent(String content) {
		// TODO Auto-generated method stub
		return threadMapper.searchThroughTitleAndContent(content);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#delete(com.stars.entity.Thread)
	 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		threadMapper.delete(id);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#update(java.lang.String, int, java.lang.String, java.lang.String)
	 */
	@Override
	public void update(int id,String name, int uid, String title, String content) {
		// TODO Auto-generated method stub
		Forum forum=forumMapper.getByName(name);
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Thread thread=threadMapper.getById(id);
		thread.setFid(forum.getId());
		thread.setUid(uid);
		thread.setContent(content);
		thread.setTitle(title);
		thread.setTime(time);
	    threadMapper.update(thread);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#deleteByUid(int)
	 */
	@Override
	public void deleteByUid(int uid) {
		// TODO Auto-generated method stub
		threadMapper.deleteByUid(uid);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#deleteReplyNum(int)
	 */
	@Override
	public void deleteReplyNum(int id) {
		// TODO Auto-generated method stub
		threadMapper.deleteReplyNum(id);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#updateThread(com.stars.entity.Thread)
	 */
	@Override
	public void updateThread(Thread thread) {
		// TODO Auto-generated method stub
		threadMapper.updateThread(thread);
	}
	/* (non-Javadoc)
	 * @see com.stars.service.ThreadService#updateView(com.stars.entity.Thread)
	 */
	@Override
	public void updateView(Thread thread) {
		// TODO Auto-generated method stub
		threadMapper.updateView(thread);
	}
	
	/**
	 * 
	 * 
	 */
	@Override
	public PageBean<Thread> findByPage(int currentPage) {
		// TODO Auto-generated method stub
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Thread> pageBean = new PageBean<Thread>();
		
	    //封装当前页数
        pageBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = threadMapper.selectCount();
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		//封装每页显示的数据
		List<Thread> lists = threadMapper.findByPage(map);
		pageBean.setLists(lists);
		
		return pageBean;
	}
	
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return threadMapper.selectCount();
		
	}
	

}
