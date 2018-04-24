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

        String str = "16678784545123456";
        str = DigestUtils.md5DigestAsHex(str.getBytes("UTF-8"));
        System.out.println(str);
    }
}
