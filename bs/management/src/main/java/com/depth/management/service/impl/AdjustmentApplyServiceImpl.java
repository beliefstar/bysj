package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.AdjustmentApplyMapper;
import com.depth.management.model.AdjustmentApply;
import com.depth.management.model.Emp;
import com.depth.management.service.AdjustmentApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

@Service
public class AdjustmentApplyServiceImpl implements AdjustmentApplyService {

    private final AdjustmentApplyMapper adjustmentApplyMapper;

    @Autowired
    public AdjustmentApplyServiceImpl(AdjustmentApplyMapper adjustmentApplyMapper) {
        this.adjustmentApplyMapper = adjustmentApplyMapper;
    }

    @Override
    public void newAdjustmentApply(AdjustmentApply apply, Emp loginEmp) {
        Date date = new Date();
        apply.setCreateTime(date);
        apply.setCreateUser(loginEmp.getName());
        apply.setUpdateTime(date);
        apply.setUpdateUser(loginEmp.getName());
        apply.setApplyTime(date);
        apply.setOriginApprove(loginEmp.getId());
        apply.setOriginDealTime(date);
        apply.setStatus("0");

        try {
            adjustmentApplyMapper.insertSelective(apply);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public List<AdjustmentApply> findOriginByDepartmentId(Long departmentId) {
        List<AdjustmentApply> applyList;
        try {
            applyList = adjustmentApplyMapper.findOriginByDepartmentId(departmentId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return applyList;
    }

    @Override
    public List<AdjustmentApply> findArriveByDepartmentId(Long departmentId) {

        List<AdjustmentApply> applyList;
        try {
            applyList = adjustmentApplyMapper.findArriveByDepartmentId(departmentId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return applyList;
    }

    @Override
    public void update(AdjustmentApply apply, Emp loginEmp) {
        if (apply.getId() != null) {
            Date date = new Date();
            apply.setUpdateTime(date);
            apply.setUpdateUser(loginEmp.getName());
            apply.setArriveApprove(loginEmp.getId());
            apply.setArriveDealTime(date);
            try {
                adjustmentApplyMapper.updateByPrimaryKeySelective(apply);
            } catch (Exception e) {
                e.printStackTrace();
                throw new ServiceException(e);
            }
        } else {
            throw new ServiceException("ID为空");
        }
    }

    @Override
    public List<AdjustmentApply> findAll() {
        return adjustmentApplyMapper.findAll();
    }

    @Override
    public List<AdjustmentApply> findDepartmentId(Long departmentId) {
        return adjustmentApplyMapper.findByDepartmentId(departmentId);
    }
}
