package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.VacateMapper;
import com.depth.management.model.Emp;
import com.depth.management.model.Vacate;
import com.depth.management.service.VacateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        List<Vacate> vacates;
        try {
            vacates = vacateMapper.getAll(departmentId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return vacates;
    }

    @Override
    public void newVacate(String text, String timeRange, Emp loginEmp) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

        Date startTime;
        Date endTime;
        Date currentTime = new Date();

        if (!StringUtils.isEmpty(timeRange)) {
            String[] split = timeRange.split("-");
            try {
                startTime = sdf.parse(split[0].trim());
                endTime = sdf.parse(split[1].trim());
            } catch (ParseException e) {
                e.printStackTrace();
                throw new ServiceException(e);
            }
        } else {
            throw new ServiceException("参数错误！");
        }

        Vacate vacate = new Vacate();
        vacate.setText(text);
        vacate.setEmpId(loginEmp.getId());
        vacate.setBeginTime(startTime);
        vacate.setEndTime(endTime);
        vacate.setUpTime(currentTime);
        vacate.setStatus("0");
        vacate.setDepartmentId(loginEmp.getDepartmentId());

        vacate.setCreateTime(currentTime);
        vacate.setCreateUser(loginEmp.getName());
        vacate.setUpdateTime(currentTime);
        vacate.setUpdateUser(loginEmp.getName());

        try {
            vacateMapper.insertSelective(vacate);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }
}
