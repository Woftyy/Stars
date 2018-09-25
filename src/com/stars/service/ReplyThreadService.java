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

	public void add(int uid,int tid,String content);
	
	public List<ReplyThread> getReplyThreadBytid(int tid);

	
	
}
