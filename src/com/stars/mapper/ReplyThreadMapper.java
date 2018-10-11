/**
 * 
 */
package com.stars.mapper;

import java.util.List;

import com.stars.entity.ReplyThread;

/**
 * @author Administrator
 *
 */
public interface ReplyThreadMapper {

	public void add(ReplyThread replyThread);
	
	public List<ReplyThread> getReplyThreadBytid(int tid);
	
	public void delete(int id);
	
	public void deleteBytid(int tid);
	
	public void deleteByUid(int fromUid);
	
	public ReplyThread getById(int id);
	
	public void addNum();
	
	public void updateReplyThread(ReplyThread replyThread);
	
	/**获取相应主题的评论
	 * @param tid
	 * @return
	 * 2018-09-28 09:23:34
	 */
	public List<ReplyThread> getReviewList(int tid);
	
	/**获取相应主题下评论的回复
	 * @param tid
	 * @return
	 * 2018-09-28 09:24:01
	 */
	public List<ReplyThread> getReplyList(int tid);
	
    public List<ReplyThread> getReplyThreadByfromUid(int fromUid);
}
