/**
 * 
 */
package com.stars.service;

import java.util.List;

import com.stars.entity.ReplyThread;

/**
 * @author Administrator
 *
 */

public interface ReplyThreadService {

	public void add(ReplyThread replyThread);
	
	public List<ReplyThread> getReplyThreadBytid(int tid);

	
	
}
