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
    //�뙆�씪 �뾽濡쒕뱶�븷 �뤃�뜑 �깮�꽦
    public static void makeDir(String docRoot){
        File fileDir = new File(docRoot);

        if(fileDir.exists()){
            return;
        }

        fileDir.mkdirs();
    }

    public static String fileUpload(MultipartFile file, String fileName) throws IOException {
        log.info("fileUpload �샇異� �꽦怨�");

        String real_name = "";
        String path_name = "";
        //MultipartFile �겢�옒�뒪�쓽 getFile() 硫붿꽌�뱶濡� �겢�씪�씠�뼵�듃媛� �뾽濡쒕뱶�븳 �뙆�씪

        String org_name = file.getOriginalFilename();
        log.info("org_name : " + org_name);

        //�뙆�씪紐� 蹂�寃�(以묐났�릺吏� �븡寃�)
        if(org_name != null && (!org_name.equals(""))){
            real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
            //���옣�븷 �뙆�씪 �씠由�

            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);

            File fileAdd = new File(docRoot + "/" + real_name); //�뙆�씪 �깮�꽦 �썑
            log.info("�뾽濡쒕뱶 �븷 �뙆�씪(fileAdd) : " + fileAdd);

            file.transferTo((fileAdd));
            path_name = docRoot + "/" + real_name;
        }

        return path_name;
    }

    //�떎以� �뙆�씪 �뾽濡쒕뱶 硫붿꽌�뱶
    public static List<String> multipleFileUpload(List<MultipartFile> file, String fileName) throws IOException{
        log.info("multipleFileUpload �샇異� �꽦怨�");

        List<String> real_name = new ArrayList<String>();
        String name = "";

        //�뙆�씪紐� 蹂�寃�(以묐났�릺吏� �븡寃�)
        if(!file.isEmpty()){
            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);
            File fileAdd = null;
            for(MultipartFile MultiFile : file){
                name = fileName + "_" + UUID.randomUUID().toString().replaceAll("-", "") + "_" + MultiFile.getOriginalFilename(); //���옣�븷 �뙆�씪 �씠由�

                fileAdd = new File(docRoot + "/" + name);
                log.info("�뾽濡쒕뱶 �븷 �뙆�씪(fileAdd) : " + fileAdd);

                MultiFile.transferTo(fileAdd);
                real_name.add(docRoot + "/" + name);
            }
        }

        return real_name;
    }

    //�뙆�씪 �궘�젣 硫붿꽌�뱶
    public static void fileDelete(String fileName) throws IOException{
        log.info("fileDelete �샇異� �꽦怨�");

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

        File fileDelete = new File(docRoot + "/" + fileName); //�뙆�씪 �깮�꽦�썑
        log.info("�궘�젣�븷 �뙆�씪(fileDelete) : " + fileDelete);
        if(fileDelete.exists() && fileDelete.isFile()){
            result = fileDelete.delete();
            log.info("�뙆�씪 �궘�젣 �뿬遺�(true/false) : " + result);
        }
    }
}
