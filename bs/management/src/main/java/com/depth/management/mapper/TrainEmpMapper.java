package com.depth.management.mapper;

import com.depth.management.model.TrainEmp;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TrainEmpMapper extends Mapper<TrainEmp> {
    List<Long> findEmpIdsByTrainId(@Param("trainId") Long trainId);
}
