/**
 * 
 */
package com.stars.service;

import java.util.List;

import com.stars.entity.Thumb;

/**
 * @author Administrator
 *
 */
public interface ThumbService {

	
	public List<Thumb> findByRidAndUid(int rid,int uid);
	
	public void delete(int id);
	
	public void add(int uid,int rid);
	
	public void deleteByrid(int rid);
}

