package com.depth.management.service;

import com.depth.management.model.AdjustmentApply;
import com.depth.management.model.Emp;

import java.util.List;

public interface AdjustmentApplyService {
    void newAdjustmentApply(AdjustmentApply apply, Emp loginEmp);

    List<AdjustmentApply> findByOrigin(Long departmentId);

    List<AdjustmentApply> findByArrive(Long departmentId);

    void update(AdjustmentApply apply, Emp loginEmp);
}
