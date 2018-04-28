package com.depth.management.service;

import com.depth.management.model.Emp;
import com.depth.management.model.Vacate;

import java.util.List;

public interface VacateService {
    List<Vacate> getListByDepartment(Long departmentId);

    List<Vacate> getListByEmpId(Long empId);

    void newVacate(String text, String timeRange, Emp loginEmp);

    void access(Long id, Emp opa);

    void denied(Long id, Emp opa);
}
