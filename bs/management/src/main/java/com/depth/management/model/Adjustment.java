package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 岗位调度表
 */
@Table(name = "adjustment")
public class Adjustment extends BaseEntity {
    private static final long serialVersionUID = -4627424005109480500L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;
    /**
     * 原部门
     */
    private Long origin;
    /**
     * 转到部门
     */
    private Long arrive;
    /**
     * 备注
     */
    private String comment;

    public Adjustment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public Long getOrigin() {
        return origin;
    }

    public void setOrigin(Long origin) {
        this.origin = origin;
    }

    public Long getArrive() {
        return arrive;
    }

    public void setArrive(Long arrive) {
        this.arrive = arrive;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Adjustment{" +
                "id=" + id +
                ", empId=" + empId +
                ", origin=" + origin +
                ", arrive=" + arrive +
                ", comment='" + comment + '\'' +
                '}';
    }
}
