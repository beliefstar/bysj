package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.DepartmentMapper;
import com.depth.management.model.Department;
import com.depth.management.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
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

    @Override
    public void update(Department department, String opa) {
        if (department.getDepartmentId() != null) {
            department.setUpdateTime(new Date());
            department.setUpdateUser(opa);
            departmentMapper.updateByPrimaryKeySelective(department);
        }
    }

    @Override
    public List<Department> findAllByIds(List<Long> ids) {
        Example example = new Example(Department.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andIn("departmentId", ids);
        List<Department> list;
        try {
            list = departmentMapper.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return list;
    }
}
