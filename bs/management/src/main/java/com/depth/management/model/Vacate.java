package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * 请假表
 */
@Table(name = "vacate")
public class Vacate extends BaseEntity {
    private static final long serialVersionUID = 289218369059131498L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 请假内容
     */
    private String text;
    /**
     * 请假者
     */
    private Long empId;
    /**
     * 名字
     */
    @Transient
    private String name;
    /**
     * 开始时间
     */
    private Date beginTime;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 提交时间
     */
    private Date upTime;
    /**
     * 处理时间
     */
    private Date dealTime;
    /**
     * 申请状态 - 0: 新建、1：已同意、2：已拒绝
     */
    private String status;
    /**
     * 审批人
     */
    private Long approveId;
    /**
     * 部门
     */
    private Long departmentId;

    public Vacate() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getApproveId() {
        return approveId;
    }

    public void setApproveId(Long approveId) {
        this.approveId = approveId;
    }

    @Override
    public String toString() {
        return "Vacate{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", empId=" + empId +
                ", beginTime=" + beginTime +
                ", endTime=" + endTime +
                ", upTime=" + upTime +
                ", dealTime=" + dealTime +
                ", status='" + status + '\'' +
                ", approveId=" + approveId +
                '}';
    }
}
