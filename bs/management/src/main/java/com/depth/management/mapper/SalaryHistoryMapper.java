package com.depth.management.mapper;

import com.depth.management.common.vo.AnaSalaryVo;
import com.depth.management.model.SalaryHistory;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SalaryHistoryMapper extends Mapper<SalaryHistory> {
    List<AnaSalaryVo> analyze();
}
