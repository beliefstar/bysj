package com.depth.management.service;

import com.depth.management.common.vo.AnaSalaryVo;
import com.depth.management.model.SalaryHistory;

import java.util.List;

public interface SalaryHistoryService {

    List<SalaryHistory> findByEmpId(Long empId);

    SalaryHistory save(SalaryHistory sh, String opa);

    List<AnaSalaryVo> analyzeSH();

    List<SalaryHistory> findAll();
}
