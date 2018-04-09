package com.depth.management.common;

import org.springframework.util.DigestUtils;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UUIDGenerate {
    public static void main(String[] args) throws UnsupportedEncodingException {
        String str = UUID.randomUUID().toString();
        System.out.println(str);
        System.out.println(str.length());

        str = str.replaceAll("-", "");
        System.out.println(str);
        System.out.println(str.length());

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String datetime = sdf.format(date);

        System.out.println(date.getTime());
        System.out.println(System.currentTimeMillis());
        System.out.println(datetime);

        System.out.println("*******");
        SecureRandom random = new SecureRandom();
        byte[] bytes = random.generateSeed(4);
        String s = new BASE64Encoder().encode(bytes);
        System.out.println(s);

        System.out.println("---------");
        String ss2 = "Qy6+Kw==123456";
        String s2 = DigestUtils.md5DigestAsHex(ss2.getBytes("UTF-8"));
        System.out.println(s2);
    }
}
