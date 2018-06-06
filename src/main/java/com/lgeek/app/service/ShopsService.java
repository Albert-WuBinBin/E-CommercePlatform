package com.lgeek.app.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFShape;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Service;

import com.lgeek.app.mapper.ShopMapper;
import com.lgeek.app.model.BuyDetails;
import com.lgeek.app.model.Category;
import com.lgeek.app.model.Product;
import com.lgeek.app.util.POIUtil;

import sun.misc.BASE64Decoder;

@Service
public class ShopsService {

	@Resource
	ShopMapper shopMapper;
	@Resource
	HttpServletRequest request;
	@Resource
	ProductService productService;

	public static HSSFWorkbook exportExcel(List<BuyDetails> buyDetails) {
		// =========================设置标题===========================================
		List<Map<String, Object>> headInfoList = new ArrayList<Map<String, Object>>();
		Map<String, Object> itemMap = new HashMap<String, Object>();
		itemMap.put("title", "物料编码");
		itemMap.put("columnWidth", 25);
		itemMap.put("dataKey", "XH1");
		headInfoList.add(itemMap);

		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "物料名称");
		itemMap.put("columnWidth", 50);
		itemMap.put("dataKey", "XH2");
		headInfoList.add(itemMap);

		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "物料描述");
		itemMap.put("columnWidth", 50);
		itemMap.put("dataKey", "XH3");
		headInfoList.add(itemMap);

		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "规格型号");
		itemMap.put("columnWidth", 30);
		itemMap.put("dataKey", "XH4");
		headInfoList.add(itemMap);

		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "数量");
		itemMap.put("columnWidth", 10);
		itemMap.put("dataKey", "XH5");
		headInfoList.add(itemMap);

		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "未税单价");
		itemMap.put("columnWidth", 15);
		itemMap.put("dataKey", "XH6");
		headInfoList.add(itemMap);
		
		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "含税单价");
		itemMap.put("columnWidth", 15);
		itemMap.put("dataKey", "XH7");
		headInfoList.add(itemMap);
		
		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "市场价格");
		itemMap.put("columnWidth", 15);
		itemMap.put("dataKey", "XH8");
		headInfoList.add(itemMap);
			
		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "消费金额");
		itemMap.put("columnWidth", 15);
		itemMap.put("dataKey", "XH9");
		headInfoList.add(itemMap);
		
		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "供应商名称");
		itemMap.put("columnWidth", 20);
		itemMap.put("dataKey", "XH10");
		headInfoList.add(itemMap);
		itemMap = new HashMap<String, Object>();
		itemMap.put("title", "照片");
		itemMap.put("columnWidth", 12);
		itemMap.put("dataKey", "XH11");
		headInfoList.add(itemMap);
		// ==========================填充数据======================================
		return POIUtil.exportExcel("采购信息", headInfoList, buyDetails);
	}

	public void importExcel(File target) throws IOException {
		try {
			final Integer s_id = Integer.parseInt(request.getSession().getAttribute("s_id").toString());
			InputStream excelFile = new FileInputStream(target);// 输入流
			HSSFWorkbook wb = new HSSFWorkbook(excelFile);// 得到Excel工作簿对象
			final Sheet sheet = wb.getSheetAt(0);// 得到Excel工作表对象
			final HSSFSheet hssfSheet = wb.getSheetAt(0);
			ExecutorService executorService = Executors.newFixedThreadPool(5);
			executorService.execute(new Runnable() {

				@Override
				public void run() {
					try {
						getPictures(hssfSheet);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
			executorService.execute(new Runnable() {

				@Override
				public void run() {
					writeData(sheet, s_id);
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void writeData(Sheet sheet, Integer s_id) {
		try {
			String name = "", code = "", describe = "", model = "", unit = "", ca_name = "", untaxPrice = "",
					taxPrice = "", price = "";
			
			List<Category> categories = shopMapper.getAllCategory();
			int rowNum = sheet.getLastRowNum() + 1;
			for (int i = 1; i < rowNum; i++) {// 从第二行开始读取数据,第一行是表头
				try {
					Product product = new Product();
					Integer ca_id = null;
					Row row = sheet.getRow(i);// 得到Excel工作表的行
					int cellNum = row.getLastCellNum();// 取得一行的有效单元格个数
					for (int j = 0; j < cellNum; j++) {
						Cell cell = row.getCell(j);// 得到Excel工作表指定行的单元格
						String cellValue = null;
						if (cell != null && cell.getCellType() != HSSFCell.CELL_TYPE_BLANK) {
							/*
							 * CELL_TYPE_NUMERIC 数值型 0 CELL_TYPE_STRING 字符串型 1 CELL_TYPE_FORMULA 公式型 2
							 * CELL_TYPE_BLANK 空值 3 CELL_TYPE_BOOLEAN 布尔型 4 CELL_TYPE_ERROR 错误 5
							 */
							switch (cell.getCellType()) { // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
							case 0:
								cellValue = String.valueOf((long) cell.getNumericCellValue());
								break;
							case 1:
								cellValue = cell.getStringCellValue();
								break;
							case 2:
								cellValue = String.valueOf((int) cell.getNumericCellValue());
								break;
							case 3:
								cellValue = cell.getStringCellValue();
								break;
							case 4:
								cellValue = cell.getStringCellValue();
								break;
							}

							switch (j) {// 通过列数来判断对应插如的字段
							case 0:
								code = cellValue;
								break;
							case 1:
								name = cellValue;
								break;
							case 2:
								describe = cellValue;
								break;
							case 3:
								model = cellValue;
								break;
							case 4:
								unit = cellValue;
								break;
							case 5:
								untaxPrice = cellValue;
								break;
							case 6:
								taxPrice = cellValue;
								break;
							case 7:
								price = cellValue;
								break;
							case 8:
								ca_name = cellValue;
								break;
							}
						}
					}
					product.setName(name);
					product.setCode(code);
					product.setDescribe(describe);
					product.setModel(model);
					product.setUnit(unit);
					product.setUntaxPrice(untaxPrice == "" ? null : Float.parseFloat(untaxPrice));
					product.setTaxPrice(taxPrice == "" ? null : Float.parseFloat(taxPrice));
					product.setPrice(price == "" ? null : Float.parseFloat(price));
					product.setCreateTime(new Date());
					product.setBrand(ca_name);
					for (Category category : categories) {
						if (category.getName().equals(ca_name)) {
							ca_id = category.getId();
							break;
						}
					}
					product.setImage("images/"+(i+1)+".png");
					shopMapper.addProduct(product, ca_id, s_id);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void getPictures(HSSFSheet sheet) throws IOException {
		try {
			List<HSSFShape> list = sheet.getDrawingPatriarch().getChildren();
			// String path =
			// "E://工作目录//商城//E-CommercePlatform//src//main//webapp//images//xxx9.bmp";
			for (HSSFShape shape : list) {
				if (shape instanceof HSSFPicture) {
					HSSFPicture picture = (HSSFPicture) shape;
					HSSFPictureData pdata = picture.getPictureData();
					String extension = pdata.suggestFileExtension();
					GenerateImage(byte2Base64StringFun(pdata.getData()), ((HSSFPicture) shape).getFileName(),
							extension);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String byte2Base64StringFun(byte[] b) {
		return new String(Base64.encodeBase64(b));
	}

	@SuppressWarnings("restriction")
	public static boolean GenerateImage(String imgStr, String name, String extension) {
		try {
			if (imgStr == null)
				return false;
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				// Base64解码
				byte[] b = decoder.decodeBuffer(imgStr);
				for (int i = 0; i < b.length; ++i) {
					if (b[i] < 0) {// 调整异常数据
						b[i] += 256;
					}
				}
				// 生成jpeg图片E://工作目录//商城//E-CommercePlatform//src//main//webapp//images//"+name+"."+extension
				String path = "/usr/local/nginx/static/images/";
				String imgFilePath = path + name + "."+ extension;// 新生成的图片
				OutputStream out = new FileOutputStream(imgFilePath);
				out.write(b);
				out.flush();
				out.close();
				return true;
			} catch (Exception e) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
