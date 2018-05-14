package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.common.vo.AnaSalaryVo;
import com.depth.management.mapper.SalaryHistoryMapper;
import com.depth.management.model.Emp;
import com.depth.management.model.SalaryHistory;
import com.depth.management.service.EmpService;
import com.depth.management.service.SalaryHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SalaryHistoryServiceImpl implements SalaryHistoryService {

    @Autowired
    private SalaryHistoryMapper salaryHistoryMapper;

    @Autowired
    private EmpService empService;

    @Override
    public List<SalaryHistory> findByEmpId(Long empId) {
        Example example = new Example(SalaryHistory.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("empId", empId);
        example.orderBy("id").asc();
        try {
            List<SalaryHistory> sh = salaryHistoryMapper.selectByExample(example);
            List<Long> ids = sh.stream().map(SalaryHistory::getEmpId).collect(Collectors.toList());
            List<Emp> emps = empService.findByIds(ids);
            sh.forEach(item -> emps.forEach(v -> {
                if (v.getId().equals(item.getEmpId())) {
                    item.setEmp(v);
                }
            }));
            return sh;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public SalaryHistory save(SalaryHistory sh, String opa) {
        Date date = new Date();
        sh.setCreateTime(date);
        sh.setCreateUser(opa);
        sh.setUpdateTime(date);
        sh.setUpdateUser(opa);

        try {
            salaryHistoryMapper.insert(sh);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return sh;
    }

    @Override
    public List<AnaSalaryVo> analyzeSH() {
        return salaryHistoryMapper.analyze();
    }

    @Override
    public List<SalaryHistory> findAll() {
        return salaryHistoryMapper.selectAll();
    }
}
