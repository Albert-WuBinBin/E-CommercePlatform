package com.lgeek.app.service;

import java.util.List;

import com.lgeek.app.model.BuyDetails;

public interface BuyDetailsService {
	
	int addBuyDetails(BuyDetails buyDetails);
	
	Object getUnfinishedOrdersByUid(String u_id);
	
	List<BuyDetails> getUnfinishedOrdersByOrderId(String orderId);
	
	 int payment(String name,String orderId);
}
