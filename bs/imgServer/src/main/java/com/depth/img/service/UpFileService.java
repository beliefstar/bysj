package com.depth.img.service;

import org.springframework.web.multipart.MultipartFile;

public interface UpFileService {
    String upFile(MultipartFile file);
}
