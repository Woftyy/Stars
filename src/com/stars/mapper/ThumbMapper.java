/**
 * 
 */
package com.stars.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.stars.entity.Thumb;

/**
 * @author Administrator
 *
 */
public interface ThumbMapper {

    public void add(Thumb thumb);
	
    public void delete(int id);
    
	public List<Thumb> findByRidAndUid(int uid,int rid );
	
	public void deleteByrid(int rid);
	
	public void deleteByUid(int uid);
} 
