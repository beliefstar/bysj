package com.depth.management.mapper;

import com.depth.management.model.Emp;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface EmpMapper extends Mapper<Emp> {
    int checkEmail(String email);
    List<Emp> findByIds(@Param("ids") List<Long> ids);
}
