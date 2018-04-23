package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.common.vo.SysObjectTree;
import com.depth.management.mapper.SysObjectMapper;
import com.depth.management.model.SysObject;
import com.depth.management.service.SysObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SysObjectServiceImpl implements SysObjectService {

    private final SysObjectMapper sysObjectMapper;

    @Autowired
    public SysObjectServiceImpl(SysObjectMapper sysObjectMapper) {
        this.sysObjectMapper = sysObjectMapper;
    }

    @Override
    public List<SysObjectTree> findModule(Long empId) {
        List<SysObjectTree> module;
        try {
            module = sysObjectMapper.findEmpModule(empId);
        } catch (Exception e) {
            throw new ServiceException(e);
        }
        List<SysObjectTree> rel = new ArrayList<>();
        if (module != null) {
            for (SysObjectTree item : module) {
                if (item.getParentId() == 0) {
                    List<SysObjectTree> list = new ArrayList<>();
                    for (SysObjectTree v : module) {
                        if (item.getId().equals(v.getParentId())) {
                            list.add(v);
                        }
                    }
                    item.setList(list);
                    rel.add(item);
                }
            }
        }
        return rel;
    }
}
