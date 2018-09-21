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
	
	/**获取相应版块里的主题默认时间排序
	 * @param fid
	 * @return
	 * 2018-09-21 15:10:49
	 */
	public List<Thread> getListByfid(int fid);
	
	
	/**获取相应版块里最多查看的主题
	 * @param fid
	 * @return
	 * 2018-09-21 15:11:11
	 */
	public List<Thread> getMostViewsByfid(int fid);
}
