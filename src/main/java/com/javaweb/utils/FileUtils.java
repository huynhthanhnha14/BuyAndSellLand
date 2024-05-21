package com.javaweb.utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class FileUtils {
    // Validate file
    public void validateFile( MultipartFile file) throws IOException {
        // Kiểm tra tên file
        String fileName = file.getOriginalFilename();
        if(fileName == null || fileName.isEmpty()) {
            throw new IOException("tên file không được để trống");
        }

        // image.png -> png
        // avatar.jpg -> jpg
        // Kiểm tra đuôi file (jpg, png, jpeg)
        String fileExtension = getFileExtension(fileName);
        if(!checkFileExtension(fileExtension)) {
            throw new IOException("file không đúng định dạng");
        }

        // Kiểm tra dung lượng file (<= 2MB)
        double fileSize =  (double) (file.getSize() / 1_048_576);
        if( fileSize > 2) {
            throw new IOException("file không được vượt quá 2MB");
        }
    }

    // Lấy extension của file (ví dụ png, jpg, ...)
    public String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        return fileName.substring(lastIndexOf + 1);
    }

    // Kiểm tra extension của file có được phép hay không
    public boolean checkFileExtension(String fileExtension) {
        List<String> extensions = new ArrayList<>();
        extensions.add("png");
        extensions.add("jpg");
        extensions.add("jpeg");
        extensions.add("pdf");
        return extensions.contains(fileExtension.toLowerCase());
    }
}
