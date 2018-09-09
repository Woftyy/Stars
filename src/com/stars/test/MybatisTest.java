package com.stars.test;

import java.sql.Timestamp;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stars.entity.Category;
import com.stars.entity.User;
import com.stars.mapper.CategoryMapper;
import com.stars.mapper.UserMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {

	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private UserMapper userMapper;

	@Test
	public void testAdd() {
		User user = new User();
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		user.setEmail("123@qq.com");
		user.setName("ÓÃ»§01");
		user.setPassword("123");
		user.setSex("ÄÐ");
		user.setTime(d);
		userMapper.add(user);
	}

	@Test
	public void testList() {
		System.out.println(categoryMapper);
		List<Category> cs=categoryMapper.list();
		for (Category c : cs) {
			System.out.println(c.getName());
		}
	}

}
