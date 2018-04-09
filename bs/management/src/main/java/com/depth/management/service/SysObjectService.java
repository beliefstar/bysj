package com.depth.management.service;

import com.depth.management.model.SysObject;

import java.util.List;

public interface SysObjectService {

    List<SysObject> findModule(Long empId);

}
