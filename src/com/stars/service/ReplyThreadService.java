/**
 * 
 */
package com.stars.service;

import java.util.List;

import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;

/**
 * @author Administrator
 *
 */

public interface ReplyThreadService {

	public void add(int uid,int tid,String content);
	
	public List<ReplyThread> getReplyThreadBytid(int tid);

	public ReplyThread getById(int id);
	
	public void updateReplyThread(ReplyThread replyThread);
	
}
