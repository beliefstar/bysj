package com.depth.img.service.impl;

import com.depth.img.common.ServiceException;
import com.depth.img.service.UpFileService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


@Service
public class UpFileServiceImpl implements UpFileService {
    @Override
    public String upFile(MultipartFile file) {

        try {
            File filepath = new File("");
            String path = "/upload";
            String rel = "/img/" + new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            filepath = new File(filepath.getAbsolutePath() + path + rel);
            filepath.mkdirs();
            String filename = file.getOriginalFilename();
            String[] split = filename.split("\\.");
            filename = UUID.randomUUID().toString() + "." + split[1];
            String rel2 =  "/" + filename;
            filepath = new File(filepath.getAbsolutePath() + rel2);

            file.transferTo(filepath);

            return rel + rel2;


        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new ServiceException("上传失败");
    }
}
