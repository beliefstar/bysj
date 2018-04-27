package com.depth.management.service;

import com.depth.management.model.Vacate;

import java.util.List;

public interface VacateService {
    List<Vacate> getList(Long departmentId);
}
