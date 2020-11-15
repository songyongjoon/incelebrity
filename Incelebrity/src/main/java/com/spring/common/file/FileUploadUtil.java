package com.spring.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	/*파일 업로드할 폴더 생성*/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/*파일 업로드 메서드*/
	public static String FileUpload(MultipartFile file, String fileName) throws IOException{
			log.info("fileUpload 호출");
			
			String real_name = null;
			String org_name = file.getOriginalFilename();
			log.info("org_name" + org_name);
			
			//파일명 변경
			if(org_name != null && (!org_name.equals(""))) {
				real_name = fileName +"_" + System.currentTimeMillis() + "_" + org_name;
				//저장할 파일 이름
				
			String docRoot = "C://uploadStorage//" +fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name); //파일 생성후
			
			file.transferTo(fileAdd);
			
			}
			return real_name;
	}
	/* 다중 파일 업로드 메서드*/
	public static List<String> ReviewFileUpload(List<MultipartFile> file,String fileName) throws IOException{
		log.info("fileUpload 호출");
		
		List<String> real_name = new ArrayList<String>();
		String name = "";
		
		//파일명 변경
		if(!file.isEmpty()) {
			String docRoot = "C://uploadStorage//"+ fileName;
			makeDir(docRoot);
			File fileAdd = null;
			for(MultipartFile MultiFile : file) {
				name=fileName+"_"+UUID.randomUUID().toString().replaceAll("-", "")+"_"+MultiFile.getOriginalFilename();
				//저장할 파일 이름
				
				fileAdd = new File(docRoot+"/"+name);//파일 생성후
				log.info("업로드할 파일(fileAdd) : " + fileAdd);
				
				MultiFile.transferTo(fileAdd);//파일 저장
				real_name.add(name);
				
			}
		}
		return real_name;
	}
	
	/*파일 삭제 메서드*/
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출");
		
		boolean result = false;
		String startDirName = "", docRoot ="";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName+"//"+dirName;
		}else {
			docRoot="C://uploadStorage//"+dirName;
		}
		File fileDelete = new File(docRoot+"/"+fileName); //파일 생성후
		log.info("삭제할파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
			log.info("파일 삭제 여부(true/flase) : " + result);
		}
	}
}
