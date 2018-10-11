/**
 * 
 */
package com.stars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.Thumb;
import com.stars.mapper.ThumbMapper;
import com.stars.service.ThumbService;

/**
 * @author Administrator
 *
 */
@Service
@Transactional(readOnly=true)
public class ThumbServiceImpl implements ThumbService{

	@Autowired
	private ThumbMapper thumbMapper;
	
	/* (non-Javadoc)
	 * @see com.stars.service.ThumbService#findByRidAndUid(int, int)
	 */
	@Override
	public List<Thumb> findByRidAndUid(int uid, int rid) {
		// TODO Auto-generated method stub
		return thumbMapper.findByRidAndUid(uid, rid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ThumbService#delete(int)
	 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		thumbMapper.delete(id);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ThumbService#add(com.stars.entity.Thumb)
	 */
	@Override
	public void add(int rid,int uid) {
		// TODO Auto-generated method stub
		Thumb thumb = new Thumb();
		thumb.setRid(rid);
		thumb.setUid(uid);
		thumbMapper.add(thumb);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ThumbService#deleteByrid(int)
	 */
	@Override
	public void deleteByrid(int rid) {
		// TODO Auto-generated method stub
		thumbMapper.deleteByrid(rid);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.ThumbService#deleteByUid(int)
	 */
	@Override
	public void deleteByUid(int uid) {
		// TODO Auto-generated method stub
		thumbMapper.deleteByUid(uid);
	}

}
