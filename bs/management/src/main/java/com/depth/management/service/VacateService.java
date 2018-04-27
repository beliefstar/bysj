package com.depth.management.service;

import com.depth.management.model.Emp;
import com.depth.management.model.Vacate;

import java.util.List;

public interface VacateService {
    List<Vacate> getList(Long departmentId);

    void newVacate(String text, String timeRange, Emp loginEmp);
}
