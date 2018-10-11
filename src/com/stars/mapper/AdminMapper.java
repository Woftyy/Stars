/**
 * 
 */
package com.stars.mapper;

import java.util.List;

import com.stars.entity.Admin;

/**
 * @author Administrator
 *
 */
public interface AdminMapper {

	
	public void add(Admin admin);
	
    public Admin getAdminById(String id); 
    
    public Boolean checkName(String id); 
    
    public List<Admin> list();
    
    public void delete(String id);
}
