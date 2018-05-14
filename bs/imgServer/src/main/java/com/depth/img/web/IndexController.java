package com.depth.img.web;

import com.depth.img.common.Result;
import com.depth.img.service.UpFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@RestController
public class IndexController {

    @Autowired
    private UpFileService upFileService;

    @PostMapping("/upImg")
    public Result upImg(@RequestParam("file") MultipartFile file) {
        Result result = new Result();
        String s = upFileService.upFile(file);
        result.setData(s);
        return result;
    }

    @GetMapping("/img/{folder}/{fileName:.+}")
    public ResponseEntity<byte[]> getFile(@PathVariable String fileName, @PathVariable String folder) {
        File file = new File("");
        String path = "/upload/img/" + folder + "/" + fileName;
        file = new File(file.getAbsolutePath() + path);
        if (file.exists()) {
            byte[] byts = new byte[Integer.parseInt(file.length() + "")];
            try {
                DataInputStream dis = new DataInputStream(new FileInputStream(file));
                dis.read(byts);
                return ResponseEntity.ok(byts);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return ResponseEntity.notFound().build();
    }

}
