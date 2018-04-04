package com.depth.management.service.impl;

import com.depth.management.mapper.DepartmentMapper;
import com.depth.management.model.Department;
import com.depth.management.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    private final DepartmentMapper departmentMapper;

    @Autowired
    public DepartmentServiceImpl(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    @Override
    public List<Department> findAll() {
        return departmentMapper.selectAll();
    }
}
