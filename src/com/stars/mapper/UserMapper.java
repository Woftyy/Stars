package com.stars.mapper;

import java.util.List;

import com.stars.entity.Category;
import com.stars.entity.User;

public interface UserMapper {
	public int add(User user);  
    
    
    public void delete(int id);  
       
      
    public User get(int id);  
     
      
    public int update(User user);   
       
      
    public List<User> list();
}
