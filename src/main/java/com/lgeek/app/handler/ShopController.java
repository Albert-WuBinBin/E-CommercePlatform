package com.lgeek.app.handler;


import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.lgeek.app.mapper.ProductMapper;
import com.lgeek.app.mapper.ShopMapper;
import com.lgeek.app.model.Category;
import com.lgeek.app.model.Product;
import com.lgeek.app.model.Shop;
import com.lgeek.app.service.ProductService;
import com.lgeek.app.service.ShopsService;
import com.lgeek.app.service.impl.BuyDetailsServiceImpl;
import com.lgeek.app.util.UploadFUtil;



@Controller
public class ShopController {

	@Resource
	ProductMapper productMapper;
	@Resource
	ShopMapper shopMapper;
	@Resource
	HttpServletRequest request;
	@Resource
	ProductService productService;
	@Resource
	UploadFUtil uploadFUtil;
	@Resource 
	ShopsService shopsService;
	
	@ResponseBody
	@RequestMapping("getAllProduct")
	public String getAllProduct() {
		Shop shop = (Shop) request.getSession().getAttribute("shop");
		List<Product> products = productMapper.getShopProduct(shop.getId());
		System.out.println(JSONObject.toJSONString(products));
		return JSONObject.toJSONString(products);
	}
	@ResponseBody
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct() {
		Integer s_id = Integer.parseInt(request.getSession().getAttribute("s_id").toString());
		String name=request.getParameter("name")==""?null:request.getParameter("name");
		String code=request.getParameter("code")==""?null:request.getParameter("code");
		String describe=request.getParameter("describe")==""?null:request.getParameter("describe");
		String model=request.getParameter("model")==""?null:request.getParameter("model");
		String unit=request.getParameter("unit")==""?null:request.getParameter("unit");
		String untaxPrice=request.getParameter("untaxPrice")=="0"?null:request.getParameter("untaxPrice");
		String taxPrice=request.getParameter("taxPrice")=="0"?null:request.getParameter("taxPrice");
		String price=request.getParameter("price")=="0"?null:request.getParameter("price");
		String ca_id=request.getParameter("ca_id");
		String ca_name = request.getParameter("ca_name");
		
		Product product = new Product();
		product.setName(name);
		product.setCode(code);
		product.setDescribe(describe);
		product.setModel(model);
		product.setUnit(unit);
		product.setUntaxPrice(Float.parseFloat(untaxPrice));
		product.setTaxPrice(Float.parseFloat(taxPrice));
		product.setPrice(Float.parseFloat(price));
		product.setCreateTime(new Date());
		product.setBrand(ca_name);
		shopMapper.addProduct(product, Integer.parseInt(ca_id), s_id);
		
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<>();
		map.put("msg", "添加成功");
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	@RequestMapping(value="/uploadfile",method = RequestMethod.POST)
	public String upLoadFile(@RequestParam(value = "file", required = false)MultipartFile uploadFile,HttpServletRequest request) throws IOException{
		String type = request.getParameter("type");
		String p_id=request.getParameter("p_id");
		File file=UploadFUtil.upLoadFile(uploadFile,Integer.parseInt(type));		
		String image="images/"+file.getName();
		shopMapper.updateProduct1(p_id, image);
		return "ManageShop";
	}
	@ResponseBody
	@RequestMapping(value="/editProduct",produces = "application/json;charset=UTF-8")
	public String editProduct(Map<String, Object>map){
		String p_id=request.getParameter("id");
		String name=request.getParameter("name")==""?null:request.getParameter("name");
		String code=request.getParameter("code")==""?null:request.getParameter("code");
		String describe=request.getParameter("describe")==""?null:request.getParameter("describe");
		String model=request.getParameter("model")==""?null:request.getParameter("model");
		String unit=request.getParameter("unit")==""?null:request.getParameter("unit");
		String untaxPrice=request.getParameter("untaxPrice")=="0"?null:request.getParameter("untaxPrice");
		String taxPrice=request.getParameter("taxPrice")=="0"?null:request.getParameter("taxPrice");
		String price=request.getParameter("price")=="0"?null:request.getParameter("price");
		String ca_id=request.getParameter("ca_id");
		String ca_name = request.getParameter("ca_name");
		
		Product product = new Product();
		product.setId(Integer.parseInt(p_id));
		product.setName(name);
		product.setCode(code);
		product.setDescribe(describe);
		product.setModel(model);
		product.setUnit(unit);
		product.setUntaxPrice(Float.parseFloat(untaxPrice));
		product.setTaxPrice(Float.parseFloat(taxPrice));
		product.setPrice(Float.parseFloat(price));
		product.setCreateTime(new Date());
		product.setBrand(ca_name);
		shopMapper.updateProduct(product, ca_id);
		Gson gson = new Gson();
		map.put("msg", "修改成功");
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteProduct",produces = "application/json;charset=UTF-8")
	public String deleteProduct(Map<String, Object>map){
		
		String p_id=request.getParameter("id");
		shopMapper.deleteProduct(p_id);
		System.out.println(p_id);
		map.put("success", "true");
		Gson gson = new Gson();
		map.put("msg", "删除成功");
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}
	
	@RequestMapping(value="/delivery")
	public String delivery(Map<String, Object>map){
		System.out.println("delivery");
		String bd_id=request.getParameter("id");
		shopMapper.delivery(bd_id, "true");
		System.out.println(bd_id);
		return "ManageShop1";
		
	}
	@ResponseBody
	@RequestMapping("getAllCategory")
	public String getAllCategory() {
		List<Category> Category = shopMapper.getAllCategory();
		System.out.println(Category);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(Category);
		return jsonStr;
	}
	@Resource
	BuyDetailsServiceImpl buyDetailsServiceImpl;
	 
	@RequestMapping(value="/importExcel",method = RequestMethod.POST)
	public String upLoadFile1(@RequestParam(value = "file", required = false)MultipartFile uploadFile,HttpServletRequest request) throws IOException{
		File target=UploadFUtil.upLoadFile(uploadFile,2);//文件上传	
		shopsService.importExcel(target);
		return "ManageShop";
}
	
}
