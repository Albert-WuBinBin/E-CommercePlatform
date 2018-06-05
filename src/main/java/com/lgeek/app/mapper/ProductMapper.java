package com.lgeek.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lgeek.app.model.Product;




public interface ProductMapper {

	public List<Product> getProduct(String id);
	public Product getProduct1(String id);
	public List<Product> getShopProduct(@Param("s_id")Integer s_id);
	public int getTotalBookNumber();
	public List<Product> getPageList(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("searchtext")String searchtext);
	public List<Product> getPageList1(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("max") int max,@Param("searchtext")String searchtext);
	public List<Product> getPageList2(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("max") int max,@Param("min")int min,@Param("searchtext")String searchtext);
	public List<Product> getPageList3(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("min") int min,@Param("searchtext")String searchtext);
	public List<Product> getPageList4(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize, @Param("ca_id") String ca_id, @Param("searchtext")String searchtext);
	public List<Product> getPageList5(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize, @Param("ca_id") String ca_id,@Param("max") int max, @Param("searchtext")String searchtext);
	public List<Product> getPageList6(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize, @Param("ca_id") String ca_id,@Param("max") int max,@Param("min") int min, @Param("searchtext")String searchtext);
	public List<Product> getPageList7(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize, @Param("ca_id") String ca_id,@Param("min") int min, @Param("searchtext")String searchtext);

}
