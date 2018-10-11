/**
 * 
 */
package com.stars.service;

import java.util.List;

import com.stars.entity.Admin;
import com.stars.entity.User;

/**
 * @author Administrator
 *
 */
public interface AdminService {
	//登录判断
		public boolean checkLogin(String id, String password);
		//通过id获取Admin
		public Admin getAdminById(String id); 
		
		  public List<Admin> list();
		  
		  public void add(Admin admin);
		  
		  public void delete(String id);
}
