/**
 * 
 */
package com.stars.mapper;

import com.stars.entity.Admin;

/**
 * @author Administrator
 *
 */
public interface AdminMapper {

	
    public Admin getAdminById(String id); 
    
    public Boolean checkName(String id); 
}
