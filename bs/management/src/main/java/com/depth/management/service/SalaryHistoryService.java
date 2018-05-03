package com.depth.management.service;

import com.depth.management.model.SalaryHistory;

import java.util.List;

public interface SalaryHistoryService {

    List<SalaryHistory> findByEmpId(Long empId);

    SalaryHistory save(SalaryHistory sh, String opa);
}
