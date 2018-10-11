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

	public void add(int fromUid,int toUid,int tid,String content);
	
	public List<ReplyThread> getReplyThreadBytid(int tid);

	public ReplyThread getById(int id);
	
	public void updateReplyThread(ReplyThread replyThread);
	
	public List<ReplyThread> getReviewList(int tid);
	
	public List<ReplyThread> getReplyList(int tid);
	
	public void deleteBytid(int tid);
	
    public List<ReplyThread> getReplyThreadByfromUid(int fromUid);
    
	public void delete(int id);
	
	public void deleteByUid(int fromUid);
    
}
