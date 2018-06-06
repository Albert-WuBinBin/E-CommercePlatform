package com.lgeek.app.handler;


import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.lgeek.app.mapper.ProductMapper;
import com.lgeek.app.mapper.UserMapper;
import com.lgeek.app.model.BuyDetails;
import com.lgeek.app.model.Category;
import com.lgeek.app.model.Page;
import com.lgeek.app.model.Product;
import com.lgeek.app.model.Secretsecurity;
import com.lgeek.app.model.Shop;
import com.lgeek.app.model.User;
import com.lgeek.app.service.ProductService;
import com.lgeek.app.service.ShopsService;
import com.lgeek.app.service.UserService;
import com.lgeek.app.service.impl.BuyDetailsServiceImpl;

@Controller
public class UserController {

	 Logger logger = LoggerFactory.getLogger(UserController.class);
	 
	@Resource
	UserMapper userMapper;

	@Resource
	HttpSession session;

	@Resource
	ProductMapper productMapper;

	@Resource
	ProductService productService;
	@Resource
	HttpServletRequest request;
	@Resource
	HttpServletResponse response;

	@RequestMapping("login")
	public String login(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam("radio") String radio) {
		User user = userMapper.getUserByID(id);
		if(user!=null) {
			if (password.equalsIgnoreCase(user.getPassword())) {
				if(user.getPosition().equals(radio)){
					System.out.println(radio);
					session.setAttribute("position", radio);
					session.setAttribute("username", user.getName());
					session.setAttribute("password", user.getPassword());
					session.setAttribute("id", id);
					session.setAttribute("user", user);
					if (user.getShop() != null) {
						session.setAttribute("s_id", user.getShop().getId());
						session.setAttribute("shop", user.getShop());
					}
					Object unfinishedOrders = buyDetailsServiceImpl.getUnfinishedOrdersByUid(id);
					request.getSession().setAttribute("buyDetails", unfinishedOrders);
					session.setMaxInactiveInterval(6000);
					return "homePage";
				}
				else {
					session.setAttribute("loginError", "Please enter true id and password!!!");
					return "login";
				}
				
			} else {
				session.setAttribute("loginError", "Please enter true id and password!!!");
				return "login";
			}
		}
		else{
			session.setAttribute("loginError", "Please enter true id and password!!!");
			return "login";
		}
		
	}

	@ResponseBody
	@RequestMapping(value = "/checkID", method=RequestMethod.POST)
	public String checkID(@RequestParam("id") String id, Map<String, Object> map) throws Exception {
		
		User user = userMapper.getUserByID(id);
		if (user!=null) {
			map.put("checkID", "该账号已存在");
		} else {
			map.put("checkID", "该账号可以用");
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUser() {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String idcart=request.getParameter("idcart");

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(password);
		user.setSex(sex);
		user.setAge(age==""?null:Integer.parseInt(age));
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setIdcart(idcart);
		user.setMoney(0);
		user.setPosition("User");
		user.setCreateTime(new Date());
		userMapper.addUser(user);
		return returnTrue();
	}
	public String returnTrue() {
		Map<String,String> map = new HashMap<>();
		map.put("msg", "success");
		return JSON.toJSONString(map);
	}
	@RequestMapping("/register")
	public String register(User user) {
		System.out.println("User:" + user);
		userMapper.register(user);
		return "afterRegister";
	}

	@RequestMapping("/logout")
	public String logout() {
		Enumeration e=session.getAttributeNames(); 
		while(e.hasMoreElements()){ 
			String sessionName=(String)e.nextElement(); 
			session.removeAttribute(sessionName); }
		return "homePage";
	}

	
	@RequestMapping(value="/ShowAllGoods",method=RequestMethod.GET)
	public String showAllGoods(Map<String, Object> map) {
		int pageNo = 1;
		String ca_id=request.getParameter("ca_id");	
		String max=request.getParameter("max");		
		String min=request.getParameter("min");
		String searchtext=request.getParameter("searchtext");
		if(searchtext!=null){
			request.setAttribute("searchtext", searchtext);
		}
		String pageNoStr = request.getParameter("pageNo");
		 if(searchtext==null){
			searchtext="%%";
		 }
		 else{
			searchtext="%"+searchtext+"%";
		 }
		if(ca_id==null||ca_id.equalsIgnoreCase("0")){
			ca_id=null;
			
		}
		if(max==null||max.equalsIgnoreCase("0")){
			max=null;
		}
		if(min==null||min.equalsIgnoreCase("0")){
			min=null;
		}
		try {
			pageNo = Integer.parseInt(pageNoStr);
			
		} catch (NumberFormatException e) {
		}
		System.out.println("pageNo:" + pageNo);
		Page<Product> page=productService.searchGoods(ca_id,pageNo,max,min,searchtext,request);
		
		map.put("productPage", page);
		System.out.println(page);
		return "showGoods";
	}

	@RequestMapping("/showDetails")
	public String showlDetails(Map<String, Object> map) {
		String p_id = request.getParameter("p_id");
		System.out.println(p_id);
		List<Product> product = productMapper.getProduct(p_id);
		System.out.println(product);
		map.put("details", product);
		map.put("p_id", p_id);
		return "showDetails";
	}

	@RequestMapping("/confirm")
	public String confirm() {
		String id = request.getParameter("id");
		userMapper.confirm(id, "true");
		System.out.println(id);
		return "myOrder4";
	}

	@RequestMapping("/comment")
	public String comment() {
		String bd_id = request.getParameter("bd_id");
		String p_id = request.getParameter("p_id");
		System.out.println(bd_id);
		System.out.println(p_id);
		session.setAttribute("bd_id", bd_id);
		return "comment";
	}

	@RequestMapping("/submitComment")
	public String submitComment(Map<String, Object> map) {
		String star = request.getParameter("star");
		String comment = request.getParameter("comment");
		String bd_id = (String) request.getSession().getAttribute("bd_id");

		userMapper.comment(comment, star, bd_id);
		userMapper.comment1("true", bd_id);
		return "myOrder1";
	}

	@RequestMapping("/deleteAddress")
	public String delete() {
		String ra_id = request.getParameter("ra_id");
		
		System.out.println(ra_id);
		userMapper.deleteAddress(ra_id);
		return "receiptAddress";
	}

	@RequestMapping("/modifyUser")
	public String modify() {
		String id = (String) session.getAttribute("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String idcart = request.getParameter("idcart");
		String address = request.getParameter("address");
		userMapper.modifyUser(new User(id, name, phone, email, address, Integer.parseInt(age), sex, idcart));
		return "modifyPersonalInformation";
	}


	@ResponseBody
	@RequestMapping("/changePassword")
	public String changePassword(Map<String, Object>map) {
		String u_id = (String) session.getAttribute("id");
		String oldpassword=request.getParameter("p1");
		String newpassword = request.getParameter("p2");
		String oldpassword1=(String) request.getSession().getAttribute("password");
		if(oldpassword.equalsIgnoreCase(oldpassword1)){
			userMapper.changePassword(u_id, newpassword);
			Enumeration e=session.getAttributeNames(); 
			while(e.hasMoreElements()){ 
				String sessionName=(String)e.nextElement(); 
				session.removeAttribute(sessionName); 
			}
			map.put("count", "1");
			map.put("msg", "Update Successful!!!Please login again");
		}
		else{
			map.put("msg", "Please enter true old password");
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}

	@RequestMapping("/SetSecretSecurity")
	public String SetSecretSecurity() {
		String u_id = (String) session.getAttribute("id");
		String question1 = request.getParameter("question1");
		String question2 = request.getParameter("question2");
		String question3 = request.getParameter("question3");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		String answer3 = request.getParameter("answer3");
		Secretsecurity secretsecurity=userMapper.getSecretSecurity(u_id);
		if (secretsecurity != null) {
			userMapper.updateSecretSecurity(
					new Secretsecurity(u_id, question1, question2, question3, answer1, answer2, answer3));
			System.out.println("update");
		} else {
			System.out.println("insert");
			userMapper.setSecretSecurity(
					new Secretsecurity(u_id, question1, question2, question3, answer1, answer2, answer3));
		}
		session.setAttribute("setMessage", "Set Secret Security successful!");
		return "secretSecuritySettings";

	}

	@RequestMapping("/retrievePassword")
	public String retrievePassword() {
		String u_id = request.getParameter("id");
		String question1 = request.getParameter("question1");
		String question2 = request.getParameter("question2");
		String question3 = request.getParameter("question3");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		String answer3 = request.getParameter("answer3");
		boolean b = false;
		String password="";
		Secretsecurity secretsecurity=userMapper.getSecretSecurity(u_id);
		if(secretsecurity!=null) {
			if(question1.equalsIgnoreCase(secretsecurity.getQuestion1()) && question2.equalsIgnoreCase(secretsecurity.getQuestion2())
                    && question3.equalsIgnoreCase(secretsecurity.getQuestion3()) && answer1.equalsIgnoreCase(secretsecurity.getAnswer1())
                    && answer2.equalsIgnoreCase(secretsecurity.getAnswer2()) && answer3.equalsIgnoreCase(secretsecurity.getAnswer3()))
			{
				  b = true;
			}
		} else {
			session.setAttribute("RetrieveMessage", "你没有设置过密保");
		}
		if(b==true){
			User user=userMapper.getUserByID(u_id);
			password=user.getPassword();
			System.out.println(password);
			session.setAttribute("RetrieveMessage", "Your password is:"+password); 
		}
		else{
			session.setAttribute("RetrieveMessage", "Please choose the true question and enter the true password!"); 
		}
		
		return "RetrievePassword";

	}
	@Resource
	UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/addShop",method=RequestMethod.POST)
	public String addShop(Map<String,Object>map){
		String shopname = request.getParameter("name");
		List<Shop> shops = userMapper.getShops(new Shop(shopname));
		if (!shops.isEmpty()) {
			map.put("msg", "exist");
			return JSON.toJSONString(map);
		}
		Shop shop = new Shop();
		shop.setName(shopname);
		shop.setFlag("false");
		userMapper.addShop(shop);
		return returnTrue();	
	}
	@ResponseBody
	@RequestMapping(value="/editShop",method=RequestMethod.POST)
	public String editShop(Map<String,Object>map){
		String id = request.getParameter("id");
		String shopname = request.getParameter("name");
		List<Shop> shops = userMapper.getShops(new Shop(shopname));
		if (!shops.isEmpty()) {
			map.put("msg", "exist");
			return JSON.toJSONString(map);
		}
		Shop shop = new Shop();
		shop.setName(shopname);
		shop.setId(Integer.parseInt(id));
		userMapper.editShop(shop);
		return returnTrue();	
	}
	@ResponseBody
	@RequestMapping("/allotShop")
	public String allotShop(){
		
		String u_id=request.getParameter("u_id");
		String s_id=request.getParameter("s_id");
		userMapper.allotShop(u_id, s_id);
		Map<String,Object>map = new HashMap<>();
		map.put("msg", "success");
		return JSON.toJSONString(map);
	}
	@ResponseBody
	@RequestMapping("/deleteUserShop")
	public String deleteUserShop(){
		String id=request.getParameter("id");
		userMapper.deleteUserShop(id);
		Map<String,Object>map = new HashMap<>();
		map.put("msg", "success");
		return JSON.toJSONString(map);
	}
	@ResponseBody
	@RequestMapping("/deleteUser")
	public String deleteUser(){
		String id=request.getParameter("id");
		userMapper.deleteUser(id);
		Map<String,Object>map = new HashMap<>();
		map.put("msg", "success");
		return JSON.toJSONString(map);
	}
	@ResponseBody
	@RequestMapping(value="/getShops",method=RequestMethod.GET)
	public String getShops() {
		String shopname=request.getParameter("shopname");
		String flag=request.getParameter("flag");
		if(shopname==null) {
			shopname = "%%";
		}
		else {
			shopname = "%"+shopname+"%";
		}
		Shop shop = new Shop();
		shop.setName(shopname);
		shop.setFlag(flag);
		List<Shop> Shop = userMapper.getShops(shop);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(Shop);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("/approval")
	public String approval(Map<String,Object>map) {
		String s_id=request.getParameter("s_id");
		String flag=request.getParameter("flag");
	
		userMapper.approval(s_id,flag);
		map.put("msg", "approval");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("/deleteShop")
	public String deleteShop(Map<String,Object>map) {
		String s_id=request.getParameter("s_id");

		userMapper.deleteProductByShopId(s_id);
		userMapper.deleteUserShop(s_id);
		userMapper.deleteShopById(s_id);
		map.put("msg", "删除成功");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("getCategory")
	public String getCategory() {
		List<Category> categories = userMapper.getCategory(new Category());
		Gson gson = new Gson();
		String jsonStr = gson.toJson(categories);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("addCategory")
	public String addCategory(Map<String,Object>map) {
		
		String name=request.getParameter("name");
		Category category = new Category();
		category.setName(name);
		List<Category> categorys = userMapper.getCategory(category);
		if(!categorys.isEmpty()) {
			map.put("msg", "exist");
			return JSON.toJSONString(map);
		}
		userMapper.addCategory(name);
		map.put("msg","success");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("editCategory")
	public String editCategory(Map<String,Object>map) {
		String name=request.getParameter("name");
		String ca_id=request.getParameter("id");
		userMapper.editCategory(name,ca_id);
		map.put("msg","修改成功");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("/deleteCategory")
	public String deleteCategory(Map<String,Object>map) {
		String ca_id=request.getParameter("ca_id");
		userMapper.deleteCategoryById(ca_id);	
		map.put("msg", "删除成功");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("/recharge")
	public String recharge() {
		String id=request.getParameter("id");
		List<User> users=userMapper.recharge("%"+id+"%");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(users);
		return jsonStr;
	}
	@ResponseBody
	@RequestMapping("/recharge1")
	public String recharge1(Map<String, Object>map) {
		String u_id=request.getParameter("u_id");
		String oldmoney=request.getParameter("oldmoney");
		String addmoney=request.getParameter("addmoney");
		int totalmomey=Integer.parseInt(oldmoney)+Integer.parseInt(addmoney);
		userMapper.recharge1(u_id,totalmomey);
		map.put("msg", "充值成功");
		map.put("totalmoney",totalmomey);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@Resource
	BuyDetailsServiceImpl buyDetailsServiceImpl;
	@Resource
	ShopsService shopsService;

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/exportOrderToExcel", method = RequestMethod.GET)  
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {  
		String orderId = request.getParameter("orderId");
		List<BuyDetails> list = buyDetailsServiceImpl.getUnfinishedOrdersByOrderId(orderId);
		HSSFWorkbook wb = shopsService.exportExcel(list);		
		response.setContentType("application/vnd.ms-excel");    
	    response.setHeader("Content-disposition", "attachment;filename=order.xls");    
	    OutputStream ouputStream = response.getOutputStream();    
	    wb.write(ouputStream);    
	    ouputStream.flush();    
	    ouputStream.close();  	 
	}
}
