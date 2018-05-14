package com.depth.management.service;

import com.depth.management.model.AdjustmentApply;
import com.depth.management.model.Emp;

import java.util.List;

public interface AdjustmentApplyService {
    void newAdjustmentApply(AdjustmentApply apply, Emp loginEmp);

    List<AdjustmentApply> findOriginByDepartmentId(Long departmentId);

    List<AdjustmentApply> findArriveByDepartmentId(Long departmentId);

    void update(AdjustmentApply apply, Emp loginEmp);

    List<AdjustmentApply> findAll();

    List<AdjustmentApply> findDepartmentId(Long departmentId);
}
