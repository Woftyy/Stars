/**
 * 
 */
package com.stars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.entity.Admin;
import com.stars.entity.User;
import com.stars.mapper.AdminMapper;
import com.stars.service.AdminService;

@Service
@Transactional(readOnly=true)
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

	/* (non-Javadoc)
	 * @see com.stars.service.AdminService#checkLogin(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean checkLogin(String id, String password) {
		// TODO Auto-generated method stub
		if(adminMapper.checkName(id)!=null) {
			Admin admin =adminMapper.getAdminById(id);
			if (admin.getPassword().equals(password)) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see com.stars.service.AdminService#getAdminById(java.lang.String)
	 */
	@Override
	public Admin getAdminById(String id) {
		// TODO Auto-generated method stub
		return adminMapper.getAdminById(id);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.AdminService#list()
	 */
	@Override
	public List<Admin> list() {
		// TODO Auto-generated method stub
		return adminMapper.list();
	}

	/* (non-Javadoc)
	 * @see com.stars.service.AdminService#add(com.stars.entity.Admin)
	 */
	@Override
	public void add(Admin admin) {
		// TODO Auto-generated method stub
	  adminMapper.add(admin);
	}

	/* (non-Javadoc)
	 * @see com.stars.service.AdminService#delete(java.lang.String)
	 */
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
      adminMapper.delete(id);
}

}
