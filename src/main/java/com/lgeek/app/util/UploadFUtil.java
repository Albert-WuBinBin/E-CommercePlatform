package com.lgeek.app.util;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class UploadFUtil {
	
	public static File upLoadFile(MultipartFile uploadFile,HttpServletRequest request) throws IOException{
		request.setCharacterEncoding("UTF-8");
		MultipartFile file = uploadFile;
		@SuppressWarnings("unused")
		String uploadFileName = file.getOriginalFilename();
		
		System.out.println("uploadFileName"+uploadFileName);
		InputStream isRef = file.getInputStream();

//		String targetDir = request.getSession().getServletContext().getRealPath("/upload");
//		
//		System.out.println(targetDir+uploadFileName);
//		File uploadFlie = new File(targetDir);
//		if(!uploadFlie.exists()){      
//			uploadFlie.mkdir();		    
//		}
//		String uploadPath = "E://工作目录//商城//E-CommercePlatform//src//main//webapp//images";
		String uploadPath = "/usr/local/nginx/static/images";
		File targetFile = new File(uploadPath,uploadFileName);
			
		FileOutputStream fosRef = new FileOutputStream(targetFile);
		IOUtils.copy(isRef, fosRef);
		return targetFile;
	}

}
