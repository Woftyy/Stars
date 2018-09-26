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
	
	public ReplyThread getById(int id);
	
	public void addNum();
	
	public void updateReplyThread(ReplyThread replyThread);
}
