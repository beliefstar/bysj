package com.depth.management.common;

import sun.misc.BASE64Encoder;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UUIDGenerate {
    public static void main(String[] args) {
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
    }
}
