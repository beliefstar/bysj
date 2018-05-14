package com.depth.management.service;

import com.depth.management.common.vo.SysObjectTree;

import java.util.List;

public interface SysObjectService {

    List<SysObjectTree> findModule(Long empId);

    void updateEmpRoleByEmpId(Long empId, Integer roleId);
}
