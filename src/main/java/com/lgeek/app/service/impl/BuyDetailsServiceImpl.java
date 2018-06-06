package com.lgeek.app.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lgeek.app.mapper.BuyDetailsMapper;
import com.lgeek.app.model.BuyDetails;
import com.lgeek.app.service.BuyDetailsService;

@Service
public class BuyDetailsServiceImpl implements BuyDetailsService{

	@Resource
	BuyDetailsMapper  buyDetailsMapper;
	
	@Override
	public int addBuyDetails(BuyDetails buyDetails) {
		return buyDetailsMapper.insertSelective(buyDetails);
	}

	@Override
	public Object getUnfinishedOrdersByUid(String u_id) {
		try {
			List<BuyDetails> unfinishedOrders = buyDetailsMapper.getUnfinishedOrdersByUid(u_id);
			List<String> orderIds = new ArrayList<>();
			for (BuyDetails buyDetails : unfinishedOrders) {
				if(!orderIds.contains(buyDetails.getOrderId())) {
					orderIds.add(buyDetails.getOrderId());
				}
			}
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			List<BuyDetails> details = null;
			String orderId = "";
			for(int i=0;i<orderIds.size();i++) {
				jsonObject = new JSONObject();
				details = new ArrayList<>();
				orderId = orderIds.get(i);
				for (BuyDetails buyDetails : unfinishedOrders) {
					if(orderId.equals(buyDetails.getOrderId())) {
						details.add(buyDetails);
					}
				}
				jsonObject.put("orderId", orderId);
				jsonObject.put("buyDetails", details);
				jsonArray.add(jsonObject);
			}
			return jsonArray;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return null;
	}

	@Override
	public List<BuyDetails> getUnfinishedOrdersByOrderId(String orderId) {
		return buyDetailsMapper.getUnfinishedOrdersByOrderId(orderId);
	}

	@Override
	public int payment(String name, String orderId) {
		return buyDetailsMapper.payment(name, orderId);
	}

}
