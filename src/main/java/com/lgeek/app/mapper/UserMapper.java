package com.lgeek.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lgeek.app.model.BuyDetails;
import com.lgeek.app.model.Category;
import com.lgeek.app.model.ReceiptAddress;
import com.lgeek.app.model.Secretsecurity;
import com.lgeek.app.model.Shop;
import com.lgeek.app.model.User;


public interface UserMapper {

	public User getUserByID(String id);
	public List<User> getUser();
	public void addUser(User user);
	public void register(User user);
	public void deleteUser(String id);
	public void addReceiptAddress(ReceiptAddress receiptAddress);
	public List<ReceiptAddress> getReceiptAddress(String id);
	public List<ReceiptAddress> getReceiptAddress1(@Param("ra_id")String ra_id);
	public void editReceiptAddress(@Param("name")String name,@Param("phone")String phone,@Param("address")String address,@Param("ra_id")String ra_id);
	public void addBuyDetails(BuyDetails buyDetails);
	public void payment(@Param("money")int money,@Param("id")String id);
	public void payment1(@Param("state")String state,@Param("id")String id);
	public void confirm(@Param("id")String id,@Param("confirm")String confirm);
	public void comment(@Param("comment")String comment,@Param("star")String star,@Param("bd_id")String id);
	public void comment1(@Param("comment")String comment,@Param("bd_id")String id);
	public void deleteAddress(@Param("ra_id")String ra_id);
	public void modifyUser(User user);
	public void changePassword(@Param("u_id")String u_id,@Param("password")String password);
	public Secretsecurity getSecretSecurity(@Param("u_id")String u_id);
	public void setSecretSecurity(Secretsecurity secretsecurity);
	public void updateSecretSecurity(Secretsecurity secretsecurity);
	public List<String> getShopsId();
	public void addShop(Shop shop);
	public void editShop(Shop shop);
	public void allotShop(@Param("u_id")String u_id,@Param("s_id") String s_id);
	public List<Shop> getShops(Shop shop);
	public void approval(@Param("id") String id,@Param("flag") String flag);
	public void deleteProductByShopId(@Param("s_id") String s_id);
	public void deleteUserShop(@Param("id") String id);
	public void deleteShopById(@Param("s_id") String s_id);
	
	public List<Category> getCategory(Category category);
	public void addCategory(@Param("name") String name);
	public void editCategory(@Param("name") String name,@Param("id") String id);
	public void deleteCategoryById(@Param("ca_id") String ca_id);
	
	public List<User> recharge(@Param("id")String id);public List<User> recharge2(@Param("id")String id);
	public void recharge1(@Param("u_id")String u_id, @Param("money")int totalmomey);
	
	
}
