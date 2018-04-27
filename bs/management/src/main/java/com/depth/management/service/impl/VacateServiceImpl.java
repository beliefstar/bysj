package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.VacateMapper;
import com.depth.management.model.Vacate;
import com.depth.management.service.VacateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class VacateServiceImpl implements VacateService {

    private final VacateMapper vacateMapper;

    @Autowired
    public VacateServiceImpl(VacateMapper vacateMapper) {
        this.vacateMapper = vacateMapper;
    }

    @Override
    public List<Vacate> getList(Long departmentId) {
        Example example = new Example(Vacate.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("departmentId", departmentId);
        example.orderBy("upTime").desc();
        List<Vacate> vacates;
        try {
            vacates = vacateMapper.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return vacates;
    }
}
