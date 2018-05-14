package com.depth.management.service;

import com.depth.management.model.Salary;

import java.util.List;

public interface SalaryService {

    List<Salary> findListByDepartmentId(Long departmentId);

    List<Salary> findAll();

    Salary findById(Long id);

    Salary findByEmpId(Long empId);

    Salary save(Salary salary, String opa);

    void update(Salary salary, String opa);
}
