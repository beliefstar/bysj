package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门表
 */
@Table(name = "department")
public class Department extends BaseEntity {
    private static final long serialVersionUID = 1195881981480712599L;
    /**
     * 部门ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long departmentId;
    /**
     * 父级菜单
     */
    private Long parentId;
    /**
     * 部门名称
     */
    private String name;
    /**
     * 部门经理ID
     */
    private Long master;
    /**
     * 部门介绍
     */
    private String introduce;

    public Department() {
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getMaster() {
        return master;
    }

    public void setMaster(Long master) {
        this.master = master;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Override
    public String toString() {
        return "Department{" +
                "departmentId=" + departmentId +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", master=" + master +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
