package com.depth.management.common;

import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;

public abstract class BaseEntity implements Serializable{
    /**
     * 创建时间
     */
    @Field(type = FieldType.Date)
    private Date createTime;
    /**
     * 创建者
     */
    private String createUser;
    /**
     * 修改时间
     */
    @Field(type = FieldType.Date)
    private Date updateTime;
    /**
     * 修改者
     */
    private String updateUser;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
}
