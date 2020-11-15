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
	/*���� ���ε��� ���� ����*/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/*���� ���ε� �޼���*/
	public static String FileUpload(MultipartFile file, String fileName) throws IOException{
			log.info("fileUpload ȣ��");
			
			String real_name = null;
			String org_name = file.getOriginalFilename();
			log.info("org_name" + org_name);
			
			//���ϸ� ����
			if(org_name != null && (!org_name.equals(""))) {
				real_name = fileName +"_" + System.currentTimeMillis() + "_" + org_name;
				//������ ���� �̸�
				
			String docRoot = "C://uploadStorage//" +fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name); //���� ������
			
			file.transferTo(fileAdd);
			
			}
			return real_name;
	}
	/* ���� ���� ���ε� �޼���*/
	public static List<String> ReviewFileUpload(List<MultipartFile> file,String fileName) throws IOException{
		log.info("fileUpload ȣ��");
		
		List<String> real_name = new ArrayList<String>();
		String name = "";
		
		//���ϸ� ����
		if(!file.isEmpty()) {
			String docRoot = "C://uploadStorage//"+ fileName;
			makeDir(docRoot);
			File fileAdd = null;
			for(MultipartFile MultiFile : file) {
				name=fileName+"_"+UUID.randomUUID().toString().replaceAll("-", "")+"_"+MultiFile.getOriginalFilename();
				//������ ���� �̸�
				
				fileAdd = new File(docRoot+"/"+name);//���� ������
				log.info("���ε��� ����(fileAdd) : " + fileAdd);
				
				MultiFile.transferTo(fileAdd);//���� ����
				real_name.add(name);
				
			}
		}
		return real_name;
	}
	
	/*���� ���� �޼���*/
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete ȣ��");
		
		boolean result = false;
		String startDirName = "", docRoot ="";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName+"//"+dirName;
		}else {
			docRoot="C://uploadStorage//"+dirName;
		}
		File fileDelete = new File(docRoot+"/"+fileName); //���� ������
		log.info("����������(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
			log.info("���� ���� ����(true/flase) : " + result);
		}
	}
}
