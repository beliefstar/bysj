package com.depth.management.service;

import com.depth.management.model.Emp;

import java.util.List;

public interface EmpService {
    List<Emp> findAll();
    Emp save(Emp emp);
}
