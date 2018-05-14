package com.depth.management.mapper;

import com.depth.management.model.AdjustmentApply;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AdjustmentApplyMapper extends Mapper<AdjustmentApply> {

    List<AdjustmentApply> findOriginByDepartmentId(@Param("originId") Long originId);

    List<AdjustmentApply> findArriveByDepartmentId(@Param("arriveId") Long arriveId);

    List<AdjustmentApply> findAll();

    List<AdjustmentApply> findByDepartmentId(@Param("departmentId") Long departmentId);
}
