package com.spring.common.file;

import lombok.extern.log4j.Log4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j
public class FileUploadUtil {
    //파일 업로드할 폴더 생성
    public static void makeDir(String docRoot){
        File fileDir = new File(docRoot);

        if(fileDir.exists()){
            return;
        }

        fileDir.mkdirs();
    }

    public static String fileUpload(MultipartFile file, String fileName) throws IOException {
        log.info("fileUpload 호출 성공");

        String real_name = "";
        String path_name = "";
        //MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일

        String org_name = file.getOriginalFilename();
        log.info("org_name : " + org_name);

        //파일명 변경(중복되지 않게)
        if(org_name != null && (!org_name.equals(""))){
            real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
            //저장할 파일 이름

            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);

            File fileAdd = new File(docRoot + "/" + real_name); //파일 생성 후
            log.info("업로드 할 파일(fileAdd) : " + fileAdd);

            file.transferTo((fileAdd));
            path_name = docRoot + "/" + real_name;
        }

        return path_name;
    }

    //다중 파일 업로드 메서드
    public static List<String> multipleFileUpload(List<MultipartFile> file, String fileName) throws IOException{
        log.info("multipleFileUpload 호출 성공");

        List<String> real_name = new ArrayList<String>();
        String name = "";

        //파일명 변경(중복되지 않게)
        if(!file.isEmpty()){
            String docRoot = "/Users/khotaehyeong/Downloads/uploadStorage/" + fileName;
            makeDir(docRoot);
            File fileAdd = null;
            for(MultipartFile MultiFile : file){
                name = fileName + "_" + UUID.randomUUID().toString().replaceAll("-", "") + "_" + MultiFile.getOriginalFilename(); //저장할 파일 이름

                fileAdd = new File(docRoot + "/" + name);
                log.info("업로드 할 파일(fileAdd) : " + fileAdd);

                MultiFile.transferTo(fileAdd);
                real_name.add(docRoot + "/" + name);
            }
        }

        return real_name;
    }

    //파일 삭제 메서드
    public static void fileDelete(String fileName) throws IOException{
        log.info("fileDelete 호출 성공");

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

        File fileDelete = new File(docRoot + "/" + fileName); //파일 생성후
        log.info("삭제할 파일(fileDelete) : " + fileDelete);
        if(fileDelete.exists() && fileDelete.isFile()){
            result = fileDelete.delete();
            log.info("파일 삭제 여부(true/false) : " + result);
        }
    }
}
