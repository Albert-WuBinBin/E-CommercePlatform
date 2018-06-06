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
	/**
	 * 
	 * @param uploadFile
	 * @param type 1图片2文档
	 * @return
	 * @throws IOException
	 */
	public static File upLoadFile(MultipartFile uploadFile,int type) throws IOException{
		String uploadPath = "";
		if(type==1) {
			uploadPath = "/usr/local/nginx/static/images";
		}
		else {
			uploadPath = "/usr/local/nginx/static/file";
		}
		File uploadFlie = new File(uploadPath);
		if(!uploadFlie.exists()){      
			uploadFlie.mkdir();		    
		}
		MultipartFile file = uploadFile;
		String uploadFileName = file.getOriginalFilename();
		InputStream isRef = file.getInputStream();
		File targetFile = new File(uploadPath,uploadFileName);
		FileOutputStream fosRef = new FileOutputStream(targetFile);
		IOUtils.copy(isRef, fosRef);
		return targetFile;
	}

}
