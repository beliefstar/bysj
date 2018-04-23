package com.depth.management.service;

import com.depth.management.model.Department;

import java.util.List;

public interface DepartmentService {
    List<Department> findAll();

    List<Department> findListByParentId(Long id);

    Department findById(Long id);
}
