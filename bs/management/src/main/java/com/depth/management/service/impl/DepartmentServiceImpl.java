package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
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

        List<Department> list;
        try {
            list = departmentMapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return list;
    }

    @Override
    public Department findById(Long id) {
        if (id.equals(0L)) {
            throw new ServiceException("为0");
        }
        Department department;
        try {
            department = departmentMapper.selectByPrimaryKey(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return department;
    }
}
