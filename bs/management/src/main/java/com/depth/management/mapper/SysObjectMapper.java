package com.depth.management.mapper;

import com.depth.management.model.SysObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysObjectMapper {

    List<String> findEmpPermissions(@Param("empId") Long empId);

    List<SysObject> findEmpModule(@Param("empId") Long empId);
}
