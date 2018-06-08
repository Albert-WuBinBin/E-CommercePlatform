package com.lgeek.app.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.lgeek.app.model.BuyDetails;

public class POIUtil {

	// 1.创建workbench HSSFWorkbook
	public HSSFWorkbook getHSSFWorkbook() {
		return new HSSFWorkbook();
	}

	/*
	 * 2创建一个Excel的Sheet,2个参数
	 * 
	 * @param hssfworkbench
	 * 
	 * @param sheetName sheet名称
	 */
	public HSSFSheet getHSSFSheet(HSSFWorkbook hssfWorkbook, String sheetName) {
		return hssfWorkbook.createSheet(sheetName);

	}

	/*
	 * 3.写入表头信息
	 * 
	 * @param hssfworkbook
	 * 
	 * @param hssfsheet
	 * 
	 * @param headInfoList List<Map<String,Object>> key:title 列标题 columnWidth 列宽
	 * dataKey 列对应的dataList item key
	 */
	public void writeHeader(HSSFWorkbook hssfWorkbook, HSSFSheet hssfSheet, List<Map<String, Object>> headInfoList) {
		// Sheet样式
		HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();

		// 设置字体
		HSSFFont font = hssfWorkbook.createFont();
		font.setFontHeightInPoints((short) 12);// 字体大小
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);// 加粗

		cellStyle.setFont(font);
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中

		HSSFRow r = hssfSheet.createRow(0);// 创建第一行
		r.setHeight((short) 380); // 设置行高
		HSSFCell cell = null;
		Map<String, Object> headInfo = null;

		// 处理excel表头
		for (int i = 0; i < headInfoList.size(); i++) {
			headInfo = headInfoList.get(i);
			cell = r.createCell(i);// 创建第i列
			cell.setCellValue(headInfo.get("title").toString());
			cell.setCellStyle(cellStyle);
			if (headInfo.containsKey("columnWidth")) {
				hssfSheet.setColumnWidth(i, (short) (((Integer) headInfo.get("columnWidth") * 8) / ((double) 1 / 20)));// 设置列宽
			}
		}
	}

	/*
	 * 4.写入内容部分
	 * 
	 * @param hssfworkbook
	 * 
	 * @param hssfsheet
	 * 
	 * @param startIndex 从1开始，多次调用需要加上前一次的dataList.size()
	 * 
	 * @param headInfoList List<Map<String,Object>> key:title 列标题 columnWidth 列宽
	 * dataKey 列对应的dataList item key
	 * 
	 * @param dataList
	 */
	public boolean writeContent(HSSFWorkbook hssfWorkbook, HSSFSheet hssfSheet, int startIndex,
			List<BuyDetails> buyDetails) {
		try {
			if (buyDetails == null || buyDetails.isEmpty()) {
				return false;
			}
			HSSFRow row;
			HSSFCell cell;
			// 处理数据
			BuyDetails details = null;
			// Sheet样式
			HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();

			// 设置字体
			HSSFFont font = hssfWorkbook.createFont();
			font.setFontHeightInPoints((short) 12);// 字体大小
			// font.setBoldweight(Font.BOLDWEIGHT_BOLD);// 加粗

			cellStyle.setFont(font);
			//cellStyle.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中
			//cellStyle.setAlignment(CellStyle.VERTICAL_CENTER);
			cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中 
			cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
			BufferedImage bufferImg = null;
			HSSFPatriarch patriarch = hssfSheet.createDrawingPatriarch(); 
			
			for (int i = 0, rownum = startIndex, len = (startIndex + buyDetails.size()); rownum < len; i++, rownum++) {
				details = buyDetails.get(i);
				row = hssfSheet.createRow(rownum);
				row.setHeightInPoints(30);

				cell = row.createCell(0);
				cell.setCellValue(details.getProduct().getCode() == null ? "" : details.getProduct().getCode());
				cell = row.createCell(1);
				cell.setCellValue(details.getProduct().getName() == null ? "" : details.getProduct().getName());
				cell = row.createCell(2);
				cell.setCellValue(details.getProduct().getDescribe() == null ? "" : details.getProduct().getDescribe());
				cell = row.createCell(3);
				cell.setCellValue(details.getProduct().getModel() == null ? "" : details.getProduct().getModel());
				cell = row.createCell(4);
				cell.setCellValue(details.getQuantity() == null ? null : details.getQuantity());
				cell = row.createCell(5);
				cell.setCellValue(
						details.getProduct().getUntaxPrice() == null ? 0 : details.getProduct().getUntaxPrice());
				cell = row.createCell(6);
				cell.setCellValue(details.getProduct().getTaxPrice() == null ? 0 : details.getProduct().getTaxPrice());
				cell = row.createCell(7);
				cell.setCellValue(details.getProduct().getPrice() == null ? 0 : details.getProduct().getPrice());
				cell = row.createCell(8);
				cell.setCellValue(details.getCost() == null ? 0 : details.getCost());
				cell = row.createCell(9);
				cell.setCellValue(details.getProduct().getBrand() == null ? ""
						: details.getProduct().getBrand());
				ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream(); 
				String imagePath = "/usr/local/nginx/static/"+details.getProduct().getImage();
				bufferImg = ImageIO.read(new File(imagePath));    
	            ImageIO.write(bufferImg, "jpeg", byteArrayOut);  
	            
	            
	            /** 
	             * 该构造函数有8个参数 
	             * 前四个参数是控制图片在单元格的位置，分别是图片距离单元格left，top，rig
	             * +ht，bottom的像素距离 
	             * 后四个参数，前连个表示图片左上角所在的cellNum和 rowNum，后天个参数对应的表示图片右下角所在的cellNum和 rowNum， 
	             * excel中的cellNum和rowNum的index都是从0开始的 
	             *  
	             */    
	            HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 0,  
	                    (short) 10, rownum, (short)11, (rownum+1));  
	            // 插入图片  
	            patriarch.createPicture(anchor, hssfWorkbook.addPicture(byteArrayOut  
	                    .toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG)); 
				for (int j = 0; j < 10; j++) {
					cell = row.getCell(j);
					cell.setCellStyle(cellStyle);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public void write2FilePath(HSSFWorkbook hssfWorkbook, String filePath) throws Exception {
		FileOutputStream fileOut = null;
		try {
			fileOut = new FileOutputStream(filePath);
			hssfWorkbook.write(fileOut);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fileOut != null) {
				fileOut.close();
			}
		}
	}
	public static HSSFWorkbook exportExcel(String sheetName, List<Map<String, Object>> headInfoList,
			List<BuyDetails> buyDetails) {
		POIUtil poiUtil = new POIUtil();
		// 1.创建 Workbook
		HSSFWorkbook hssfWorkbook = poiUtil.getHSSFWorkbook();
		// 2.创建 Sheet
		HSSFSheet hssfSheet = poiUtil.getHSSFSheet(hssfWorkbook, sheetName);
		// 3.写入 head
		poiUtil.writeHeader(hssfWorkbook, hssfSheet, headInfoList);
		// 4.写入内容
		poiUtil.writeContent(hssfWorkbook, hssfSheet, 1, buyDetails);

		return hssfWorkbook;
	}

}
