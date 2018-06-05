package com.lgeek.app.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lgeek.app.model.Category;
import com.lgeek.app.model.Product;




public interface ShopMapper {

		
		public void addProduct(@Param("p")Product product,@Param("ca_id")Integer ca_id,@Param("s_id")Integer s_id);
		public void updateProduct(@Param("p")Product product,@Param("ca_id")String ca_id);
		public void updateProduct1(@Param("p_id")String p_id,@Param("image")String image);
		public void deleteProduct(@Param("p_id")String p_id);
		public void delivery(@Param("id")String id,@Param("delivery")String delivery);
		public void delivery1(@Param("stock")String stock,@Param("p_id")String p_id);
		public List<Category> getAllCategory();
}
