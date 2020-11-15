package com.spring.common.file;

<<<<<<< HEAD
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	/*ÆÄÀÏ ¾÷·ÎµåÇÒ Æú´õ »ı¼º*/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/*ÆÄÀÏ ¾÷·Îµå ¸Ş¼­µå*/
	public static String FileUpload(MultipartFile file, String fileName) throws IOException{
			log.info("fileUpload È£Ãâ");
			
			String real_name = null;
			String org_name = file.getOriginalFilename();
			log.info("org_name" + org_name);
			
			//ÆÄÀÏ¸í º¯°æ
			if(org_name != null && (!org_name.equals(""))) {
				real_name = fileName +"_" + System.currentTimeMillis() + "_" + org_name;
				//ÀúÀåÇÒ ÆÄÀÏ ÀÌ¸§
				
			String docRoot = "C://uploadStorage//" +fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name); //ÆÄÀÏ »ı¼ºÈÄ
			
			file.transferTo(fileAdd);
			
			}
			return real_name;
	}
	/* ´ÙÁß ÆÄÀÏ ¾÷·Îµå ¸Ş¼­µå*/
	public static List<String> ReviewFileUpload(List<MultipartFile> file,String fileName) throws IOException{
		log.info("fileUpload È£Ãâ");
		
		List<String> real_name = new ArrayList<String>();
		String name = "";
		
		//ÆÄÀÏ¸í º¯°æ
		if(!file.isEmpty()) {
			String docRoot = "C://uploadStorage//"+ fileName;
			makeDir(docRoot);
			File fileAdd = null;
			for(MultipartFile MultiFile : file) {
				name=fileName+"_"+UUID.randomUUID().toString().replaceAll("-", "")+"_"+MultiFile.getOriginalFilename();
				//ÀúÀåÇÒ ÆÄÀÏ ÀÌ¸§
				
				fileAdd = new File(docRoot+"/"+name);//ÆÄÀÏ »ı¼ºÈÄ
				log.info("¾÷·ÎµåÇÒ ÆÄÀÏ(fileAdd) : " + fileAdd);
				
				MultiFile.transferTo(fileAdd);//ÆÄÀÏ ÀúÀå
				real_name.add(name);
				
			}
		}
		return real_name;
	}
	
	/*ÆÄÀÏ »èÁ¦ ¸Ş¼­µå*/
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete È£Ãâ");
		
		boolean result = false;
		String startDirName = "", docRoot ="";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName+"//"+dirName;
		}else {
			docRoot="C://uploadStorage//"+dirName;
		}
		File fileDelete = new File(docRoot+"/"+fileName); //ÆÄÀÏ »ı¼ºÈÄ
		log.info("»èÁ¦ÇÒÆÄÀÏ(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
			log.info("ÆÄÀÏ »èÁ¦ ¿©ºÎ(true/flase) : " + result);
		}
	}
=======
import lombok.extern.log4j.Log4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j
public class FileUploadUtil {
    //íŒŒì¼ ì—…ë¡œë“œí•  í´ë” ìƒì„±
    public static void makeDir(String docRoot){
        File fileDir = new File(docRoot);

        if(fileDir.exists()){
            return;
        }

        fileDir.mkdirs();
    }

    public static String fileUpload(MultipartFile file, String fileName) throws IOException {
        log.info("fileUpload í˜¸ì¶œ ì„±ê³µ");

        String real_name = "";
        String path_name = "";
        //MultipartFile í´ë˜ìŠ¤ì˜ getFile() ë©”ì„œë“œë¡œ í´ë¼ì´ì–¸íŠ¸ê°€ ì—…ë¡œë“œí•œ íŒŒì¼

        String org_name = file.getOriginalFilename();
        log.info("org_name : " + org_name);

        //íŒŒì¼ëª… ë³€ê²½(ì¤‘ë³µë˜ì§€ ì•Šê²Œ)
        if(org_name != null && (!org_name.equals(""))){
            real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
            //ì €ì¥í•  íŒŒì¼ ì´ë¦„

            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);

            File fileAdd = new File(docRoot + "/" + real_name); //íŒŒì¼ ìƒì„± í›„
            log.info("ì—…ë¡œë“œ í•  íŒŒì¼(fileAdd) : " + fileAdd);

            file.transferTo((fileAdd));
            path_name = docRoot + "/" + real_name;
        }

        return path_name;
    }

    //ë‹¤ì¤‘ íŒŒì¼ ì—…ë¡œë“œ ë©”ì„œë“œ
    public static List<String> multipleFileUpload(List<MultipartFile> file, String fileName) throws IOException{
        log.info("multipleFileUpload í˜¸ì¶œ ì„±ê³µ");

        List<String> real_name = new ArrayList<String>();
        String name = "";

        //íŒŒì¼ëª… ë³€ê²½(ì¤‘ë³µë˜ì§€ ì•Šê²Œ)
        if(!file.isEmpty()){
            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);
            File fileAdd = null;
            for(MultipartFile MultiFile : file){
                name = fileName + "_" + UUID.randomUUID().toString().replaceAll("-", "") + "_" + MultiFile.getOriginalFilename(); //ì €ì¥í•  íŒŒì¼ ì´ë¦„

                fileAdd = new File(docRoot + "/" + name);
                log.info("ì—…ë¡œë“œ í•  íŒŒì¼(fileAdd) : " + fileAdd);

                MultiFile.transferTo(fileAdd);
                real_name.add(docRoot + "/" + name);
            }
        }

        return real_name;
    }

    //íŒŒì¼ ì‚­ì œ ë©”ì„œë“œ
    public static void fileDelete(String fileName) throws IOException{
        log.info("fileDelete í˜¸ì¶œ ì„±ê³µ");

        boolean result = false;
        String startDirName = "", docRoot = "";
        String dirName = fileName.substring(0, fileName.indexOf("_"));

        if(dirName.equals("thumbnail")){
            startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length() + 1));
            docRoot = "/Users/khotaehyeong/Downloads/uploadStorage" + startDirName + "//" + dirName;
        }
        else{
            docRoot = "/Users/khotaehyeong/Downloads/uploadStorage" + dirName;
        }

        File fileDelete = new File(docRoot + "/" + fileName); //íŒŒì¼ ìƒì„±í›„
        log.info("ì‚­ì œí•  íŒŒì¼(fileDelete) : " + fileDelete);
        if(fileDelete.exists() && fileDelete.isFile()){
            result = fileDelete.delete();
            log.info("íŒŒì¼ ì‚­ì œ ì—¬ë¶€(true/false) : " + result);
        }
    }
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git
}
