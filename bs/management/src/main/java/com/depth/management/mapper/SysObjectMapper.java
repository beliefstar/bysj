package com.depth.management.mapper;

import com.depth.management.common.vo.SysObjectTree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysObjectMapper {

    List<String> findEmpPermissions(@Param("empId") Long empId);

    List<SysObjectTree> findEmpModule(@Param("empId") Long empId);

    void insertPermission(@Param("empId") Long empId, @Param("roleId") int roleId);
}
