package com.depth.management.common;

import com.depth.management.model.Emp;
import org.springframework.util.DigestUtils;

import java.io.UnsupportedEncodingException;

public class UUIDGenerate {
    public static void main(String[] args) throws UnsupportedEncodingException {
        Emp emp = new Emp();
        emp.setPost("11");
        emp.setReady("0");
        emp.setPassword("sdf");
        emp.setDepartmentId(54L);
//        EmpExample empExample = (EmpExample) emp;//no
//        System.out.println(empExample);

        String str = "123456";
        str = DigestUtils.md5DigestAsHex(str.getBytes("UTF-8"));
        System.out.println(str);

        String str2 = "2018/04/01";
        str2 = DigestUtils.md5DigestAsHex(str2.getBytes("UTF-8"));
        System.out.println(str2);

        String a = "0" + (8+1) + ":";
        System.out.println(a);
    }
}
