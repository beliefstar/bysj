package com.depth.management.common;

import com.depth.management.model.Emp;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;

public class UUIDGenerate {
    public static void main(String[] args) throws UnsupportedEncodingException, URISyntaxException {
        Emp emp = new Emp();
        emp.setPost("11");
        emp.setReady("0");
        emp.setPassword("sdf");
        emp.setDepartmentId(54L);
//        EmpExample empExample = (EmpExample) emp;//no
//        System.out.println(empExample);

        String str = "13312111212123456";
        //str = DigestUtils.md5DigestAsHex(str.getBytes("UTF-8"));
        //System.out.println(str);
        //File file = new File("src/main/java/resources/static");
        //System.out.println(file.getAbsolutePath());
/*
        String str2 = "2018/04/01";
        str2 = DigestUtils.md5DigestAsHex(str2.getBytes("UTF-8"));
        System.out.println(str2);

        String a = "0" + (8+1) + ":";
        System.out.println(a);

        System.out.println("****************");
        URI s = UUIDGenerate.class.getResource("/").toURI();
        System.out.println(s);
*/
        URI uri = UUIDGenerate.class.getClass().getResource("/upload").toURI();
        File filepath = new File(uri);
        //filepath = new File(filepath.getAbsolutePath() + "/upload");
        System.out.println(filepath.getAbsolutePath());

    }
}
