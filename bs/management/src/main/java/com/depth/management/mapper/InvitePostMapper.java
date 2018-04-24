package com.depth.management.mapper;

import com.depth.management.model.InvitePost;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface InvitePostMapper extends Mapper<InvitePost> {
    void access(@Param("approver") Long approver, @Param("user") String user, @Param("empId") Long empId);

    void denied(@Param("approver") Long approver, @Param("user") String user, @Param("empId") Long empId);
}
