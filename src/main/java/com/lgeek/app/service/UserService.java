package com.lgeek.app.service;


import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lgeek.app.mapper.UserMapper;
@Service
public class UserService {

	@Resource
	UserMapper userMapper;
	 public String getSid() {
	        Random random = new Random();
	        int a = random.nextInt(10000);
	        String s_id = "s" + a;
	        return s_id;
	    }

	    public boolean checkSid(String s_id) {
	      
	        boolean b = true;

	            List<String> shops =userMapper.getShopsId();
	            System.out.println(shops.toString());
	            if(shops.contains(s_id)){
	            	 b = false;       
	            }
	        return b;
	    }
}
