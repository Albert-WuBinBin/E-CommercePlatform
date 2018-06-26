package com.lgeek.app.service;




import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.lgeek.app.mapper.ProductMapper;
import com.lgeek.app.model.Page;
import com.lgeek.app.model.Product;
import com.lgeek.app.model.ShoppingCart;
@Service
public class ProductService {

	@Resource
	ProductMapper productMapper;
	
	 public Product getProduct(String id) {
		  Product product = productMapper.getProduct1(id);
	        return product;
	        }
	 public Page<Product> getPage(int pageNo,String searchtext) {
		 	int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        List<Product> pageList = productMapper.getPageList(pageNo, pageSize,searchtext);
	        page.setList(pageList);
	        return page;
	 }
	 public Page<Product> getPage1(int pageNo,int max,String searchtext) {
		 	int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList1(pageNo, pageSize,max,searchtext));
	        return page;
	 }
	 public Page<Product> getPage2(int pageNo,int max,int min,String searchtext) {
		 	int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList2(pageNo,pageSize,max,min,searchtext));
	       
	        return page;
	 }
	 public Page<Product> getPage3(int pageNo,int min,String searchtext) {
		 	int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList3(pageNo, pageSize,min,searchtext));
	        return page;
	 }
	 public Page<Product> getPage4(int pageNo, String ca_id,String searchtext) {
		 int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList4(pageNo, pageSize,ca_id,searchtext));
	        return page;
	}
	 public Page<Product> getPage5(int pageNo, String ca_id,int max, String searchtext) {
		 int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList5(pageNo, pageSize,ca_id,max,searchtext));
	        return page;
	}
	 public Page<Product> getPage6(int pageNo, String ca_id,int max,int min, String searchtext) {
		 int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList6(pageNo, pageSize,ca_id,max,min,searchtext));
	        return page;
	}
	 public Page<Product> getPage7(int pageNo, String ca_id,int min, String searchtext) {
		 int pageSize=8;
	        Page<Product> page = new Page<>(pageNo);
	        page.setTotalItemNumber(productMapper.getTotalBookNumber());
	        pageNo = page.getPageNo();
	        pageNo=(pageNo - 1) * pageSize;
	        if(pageNo<0) {
	        	pageNo=0;
	        }
	        page.setList(productMapper.getPageList7(pageNo, pageSize,ca_id,min,searchtext));
	        return page;
	}
	 public ShoppingCart getShoppingCart(HttpServletRequest request) {
	        HttpSession session = request.getSession();

	        ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
	        if (sc == null) {
	            sc = new ShoppingCart();
	            session.setAttribute("ShoppingCart", sc);
	        }

	        return sc;
	    }
	 public boolean addToCart(String id, ShoppingCart sc) {
	        Product product = getProduct(id);

	        if (product != null) {
	            sc.addProduct(product);
	            return true;
	        }
	        return false;
	    }

	    public void removeItemFromShoppingCart(ShoppingCart sc, Integer id) {
	        sc.removeItem(id);
	    }

	    public void clearShoppingCart(ShoppingCart sc) {
	        sc.clear();
	    }

	    public void updateItemQuantity(ShoppingCart sc, Integer id, int quantity) {
	        sc.updateItemQuantity(id, quantity);
	    }
	    public String getPid() {
	        Random random = new Random();
	        int a = random.nextInt(10000);
	        String p_id = "p" + a;
	        return p_id;
	    }

//	    public boolean checkPid(String s_id, String p_id) {
//	      
//	        boolean b = true;
//
//	            List<Product> products =productMapper.getShopProduct(s_id);
//	            	for(Product p:products){
//	            		 if (p.getId().equalsIgnoreCase(p_id)) {
//	 	                    b = false;
//	 	                   break;
//	 	                }
//	 	               continue;
//	            	} 
//	        return b;
//	    }
		public Page<Product> searchGoods(String ca_id, int pageNo, String max, String min, String searchtext,HttpServletRequest request) {
			  Page<Product> page = null;
			if(ca_id!=null){
				request.setAttribute("ca_id", ca_id);
			}
			if(max!=null){
				request.setAttribute("max", max);
			}
			if(min!=null){
				request.setAttribute("min", min);
			}
			
			if(ca_id==null&&max==null&&min==null){
				
				page= getPage(pageNo,searchtext);
			}
			else if(ca_id==null&&max!=null&&min==null){
				
				page= getPage1(pageNo,Integer.parseInt(max),searchtext);
			}
			else if(ca_id==null&&max!=null&&min!=null){
			
				page= getPage2(pageNo,Integer.parseInt(max),Integer.parseInt(min),searchtext);
				System.err.println(page);
			}
			else if(ca_id==null&&max==null&&min!=null){
				
				page= getPage3(pageNo,Integer.parseInt(min),searchtext);
			}
			else if(ca_id!=null&&ca_id!="null"&&max==null&&min==null||max==""||min==""){
					page= getPage4(pageNo,ca_id,searchtext);	
			}
			else if(ca_id!=null&&max!=null&&min==null){
					page= getPage5(pageNo,ca_id,Integer.parseInt(max),searchtext);
			}
			else if(ca_id!=null&&max!=null&&min!=null&&max!=""&&min!=""){
				page= getPage6(pageNo,ca_id,Integer.parseInt(max),Integer.parseInt(min),searchtext);
			}
			else if(ca_id!=null&&min!=null&&max==null){

				page= getPage7(pageNo,ca_id,Integer.parseInt(min),searchtext);
			}
			
			return page;
		}
		
		

	    
}
