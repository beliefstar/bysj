package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.EmpMapper;
import com.depth.management.model.Emp;
import com.depth.management.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    private final EmpMapper empMapper;

    @Autowired
    public EmpServiceImpl(EmpMapper empMapper) {
        this.empMapper = empMapper;
    }


    @Override
    public Emp findById(Long id) {
        if (id == 0) {
            throw new ServiceException("ID不可为空!");
        }
        return empMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Emp> findAll() {
        return empMapper.selectAll();
    }

    @Transactional
    @Override
    public Emp save(Emp emp) {

        empMapper.insert(emp);

        return emp;
    }
}
