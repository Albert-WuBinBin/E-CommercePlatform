package com.lgeek.app.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import com.lgeek.app.model.BuyDetails;
/**
 * 商店管理
 * @author wbb
 */
@Service
public interface ShopsService {
	HSSFWorkbook exportExcel(List<BuyDetails> buyDetails);
	void importExcel(File target) throws IOException;
}
