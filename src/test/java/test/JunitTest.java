package test;


import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.alibaba.fastjson.JSON;
import com.lgeek.app.service.impl.BuyDetailsServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	     "classpath:springmvc.xml",
	     "classpath:spring-mybatis.xml"
		})
@WebAppConfiguration 
public class JunitTest {
	
	@Resource
	BuyDetailsServiceImpl buyDetailsServiceImpl;
	@Test
	public void test() {
		Object object = buyDetailsServiceImpl.getUnfinishedOrders("u_12346");
		System.out.println(JSON.toJSONString(object));
	}
}
