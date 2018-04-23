package com.depth.management.common;

import com.depth.management.model.Emp;
import org.springframework.util.DigestUtils;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UUIDGenerate {
    public static void main(String[] args) throws UnsupportedEncodingException {
        Emp emp = new Emp();
        emp.setPost("11");
        emp.setReady("0");
        emp.setPassword("sdf");
        emp.setDepartmentId(54L);
//        EmpExample empExample = (EmpExample) emp;//no
//        System.out.println(empExample);
    }
}
