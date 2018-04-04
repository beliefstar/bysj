package com.depth.management.mapper;

import com.depth.management.model.Emp;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface EmpMapper extends Mapper<Emp>, MySqlMapper<Emp> {
}
