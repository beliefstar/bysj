package com.depth.management.mapper;

import com.depth.management.model.Vacate;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface VacateMapper extends Mapper<Vacate> {
    List<Vacate> getAllByDepartment(@Param("departmentId") Long departmentId);

    List<Vacate> getAllByEmpId(@Param("empId") Long empId);

    List<Vacate> getAll();
}