package com.lgeek.app.handler;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lgeek.app.mapper.UserMapper;
import com.lgeek.app.model.BuyDetails;
import com.lgeek.app.model.Product;
import com.lgeek.app.model.ReceiptAddress;
import com.lgeek.app.model.ShoppingCart;
import com.lgeek.app.model.User;
import com.lgeek.app.service.ProductService;
import com.lgeek.app.service.impl.BuyDetailsServiceImpl;
import com.lgeek.app.util.CommonUtil;

@Controller
public class CartController {

	@Resource
	HttpServletRequest request;
	@Resource
	ProductService productService;
	@Resource
	HttpServletResponse response;
	@Resource
	UserMapper userMapper;
	@Resource
	BuyDetailsServiceImpl buyDetailsServiceImpl;

	@RequestMapping("/addToCart")
	public String addToCart() {
		String b = "";
		String id = request.getParameter("p_id");
		System.out.println("ID:" + id);
		boolean flag = false;
		ShoppingCart sc = productService.getShoppingCart(request);
		flag = productService.addToCart(id, sc);
		if (flag) {
			b = "cart";
		}
		return b;
	}

	@ResponseBody
	@RequestMapping(value = "updateItemQuantity", produces = "application/json;charset=UTF-8")
	public String updateItemQuantity() throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String quantityStr = request.getParameter("quantity");
		ShoppingCart sc = productService.getShoppingCart(request);
		int quantity = -1;
		try {
			quantity = Integer.parseInt(quantityStr);
		} catch (Exception e) {
		}

		if (quantity > 0) {
			productService.updateItemQuantity(sc, id, quantity);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("productNumber", sc.getProductNumber());
		result.put("totalMoney", sc.getTotalMoney());
		System.out.println(sc.getProductNumber());
		System.out.println(sc.getTotalMoney());

		Gson gson = new Gson();
		String jsonStr = gson.toJson(result);

		return jsonStr;
	}

	@RequestMapping("remove")
	public String remove() {
		int id = Integer.parseInt(request.getParameter("id"));
		ShoppingCart sc = productService.getShoppingCart(request);
		productService.removeItemFromShoppingCart(sc, id);

		return "cart";
	}

	@RequestMapping("/clear")
	public String clear() {
		ShoppingCart sc = productService.getShoppingCart(request);
		productService.clearShoppingCart(sc);
		return "cart";
	}

	@RequestMapping("/checkout")
	public String checkout(Map<String, Object> map) {
		String id = (String) request.getSession().getAttribute("id");
		List<ReceiptAddress> receiptAddresses = userMapper.getReceiptAddress(id);
		System.out.println(receiptAddresses);
		map.put("receiptAddresses", receiptAddresses);
		System.out.println("");
		return "checkout";
	}

	@ResponseBody
	@RequestMapping(value = "/newAddress", produces = "application/json;charset=UTF-8")
	public String newAddress(Map<String, Object> map) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		ReceiptAddress receiptAddress = new ReceiptAddress(name, phone, address, id);
		userMapper.addReceiptAddress(receiptAddress);
		Gson gson = new Gson();
		map.put("msg", "添加成功");
		String jsonStr = gson.toJson(map);

		return jsonStr;

	}

	@ResponseBody
	@RequestMapping(value = "/getAddressById", produces = "application/json;charset=UTF-8")
	public String getAddressById(Map<String, Object> map) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String ra_id = request.getParameter("ra_id");
		request.getSession().setAttribute("ra_id", ra_id);
		List<ReceiptAddress> list = userMapper.getReceiptAddress1(ra_id);
		System.out.println("list" + list);
		Gson gson = new Gson();
		map.put("row", list);
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}

	@ResponseBody
	@RequestMapping(value = "/editAddress", produces = "application/json;charset=UTF-8")
	public String editAddress(Map<String, Object> map) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String ra_id = (String) request.getSession().getAttribute("ra_id");
		request.getSession().removeAttribute("ra_id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		userMapper.editReceiptAddress(name, phone, address, ra_id);
		Gson gson = new Gson();
		map.put("msg", "修改成功");

		String jsonStr = gson.toJson(map);
		return jsonStr;
	}

	@RequestMapping("/submitOrder")
	public String submitOrder() throws Exception {
		request.setCharacterEncoding("UTF-8");
		String p_id = "";
		int length = Integer.parseInt(request.getParameter("length"));
		int quantity = 0;
		Float price = 0f, cost = 0f;
		System.out.println(p_id);
		BuyDetails buyDetails = null;
		String bd_state = "false";
		String bd_confirm = "false";
		String u_id = (String) request.getSession().getAttribute("id");
		String orderId = CommonUtil.getUUID();
		for (int i = 1; i <= length; i++) {
			p_id = request.getParameter("p" + i);
			price = Float.parseFloat(request.getParameter("price" + i));
			quantity = Integer.parseInt(request.getParameter("quantity" + i));
			cost = price * quantity;
			buyDetails = new BuyDetails(orderId, "", bd_state, bd_confirm, "false", "false", new Date(),
					quantity, cost, "", "", "", u_id, new Product(Integer.parseInt(p_id)));
			buyDetailsServiceImpl.addBuyDetails(buyDetails);
		}
		request.setAttribute("orderId", orderId);
		return "afterSubmitOrder";
	}

	@ResponseBody
	@RequestMapping(value = "/confirmPayment", method=RequestMethod.POST)
	public String confirmPayment(Map<String, Object> map) {
		String orderId = request.getParameter("orderId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		if (password.equalsIgnoreCase((String) request.getSession().getAttribute("password"))) {
			buyDetailsServiceImpl.payment(name, orderId);
			map.put("message", "支付成功");
		} else {
			map.put("message", "密码错误，请输入正确的密码！！！");
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		return jsonStr;
	}

}
