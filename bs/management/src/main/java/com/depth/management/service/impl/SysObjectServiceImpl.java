package com.depth.management.service.impl;

import com.depth.management.mapper.SysObjectMapper;
import com.depth.management.model.SysObject;
import com.depth.management.service.SysObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysObjectServiceImpl implements SysObjectService {

    private final SysObjectMapper sysObjectMapper;

    @Autowired
    public SysObjectServiceImpl(SysObjectMapper sysObjectMapper) {
        this.sysObjectMapper = sysObjectMapper;
    }

    @Override
    public List<SysObject> findModule(Long empId) {
        return sysObjectMapper.findEmpModule(empId);
    }
}
