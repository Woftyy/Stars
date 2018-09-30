/**
 * 
 */
package com.stars.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.ReplyThread;
import com.stars.mapper.ReplyThreadMapper;
import com.stars.mapper.ThreadMapper;
import com.stars.service.ReplyThreadService;

/**
 * @author Administrator
 *
 */
@Service
@Transactional(readOnly=true)
public class ReplyThreadServiceImpl implements ReplyThreadService{

	
	@Autowired
	private ReplyThreadMapper replyThreadMapper;
	@Autowired
	private ThreadMapper threadMapper;
	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#add(com.stars.entity.ReplyThread)
	 */
	@Override
	public void add(int fromUid,int toUid,int tid,String content) {
		// TODO Auto-generated method stub
		ReplyThread replyThread = new ReplyThread();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		replyThread.setFromUid(fromUid);
        replyThread.setTid(tid);
        replyThread.setToUid(toUid);
        replyThread.setContent(content);
        replyThread.setTime(time);
        replyThread.setNum(0);
		replyThreadMapper.add(replyThread);
		
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#getReplyThreadBytid(int)
	 */
	@Override
	public List<ReplyThread> getReplyThreadBytid(int tid) {
		// TODO Auto-generated method stub
		
		return replyThreadMapper.getReplyThreadBytid(tid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#getById(int)
	 */
	@Override
	public ReplyThread getById(int id) {
		// TODO Auto-generated method stub
		return replyThreadMapper.getById(id);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#updateReplyThread(com.stars.entity.ReplyThread)
	 */
	@Override
	public void updateReplyThread(ReplyThread replyThread) {
		// TODO Auto-generated method stub
		replyThreadMapper.updateReplyThread(replyThread);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#getReviewList(int)
	 */
	@Override
	public List<ReplyThread> getReviewList(int tid) {
		// TODO Auto-generated method stub
		
		
		return replyThreadMapper.getReviewList(tid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#getReplyList(int)
	 */
	@Override
	public List<ReplyThread> getReplyList(int tid) {
		// TODO Auto-generated method stub
		return replyThreadMapper.getReplyList(tid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#deleteBytid(int)
	 */
	@Override
	public void deleteBytid(int tid) {
		// TODO Auto-generated method stub
		replyThreadMapper.deleteBytid(tid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#getReplyThreadByfromUid(int)
	 */
	@Override
	public List<ReplyThread> getReplyThreadByfromUid(int fromUid) {
		// TODO Auto-generated method stub
		return replyThreadMapper.getReplyThreadByfromUid(fromUid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ReplyThreadService#delete(int)
	 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		replyThreadMapper.delete(id);
	}

}
