package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 培训--员工表
 */
@Table(name = "train_emp")
public class TrainEmp extends BaseEntity {
    private static final long serialVersionUID = -6978868323192623819L;
    /**
     * 员工ID
     */
    @Id
    private Long empId;
    /**
     * 培训ID
     */
    private Long trainId;
    /**
     * 状态 - 0: 正在进行中、1: 已完成、 2: 已过期
     */
    private String status;
    /**
     * 备注
     */
    private String text;
    /**
     * 审批人
     */
    private Long approver;

    public TrainEmp() {
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public Long getTrainId() {
        return trainId;
    }

    public void setTrainId(Long trainId) {
        this.trainId = trainId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getApprover() {
        return approver;
    }

    public void setApprover(Long approver) {
        this.approver = approver;
    }

    @Override
    public String toString() {
        return "TrainEmp{" +
                "empId=" + empId +
                ", trainId=" + trainId +
                ", status='" + status + '\'' +
                ", text='" + text + '\'' +
                ", approver=" + approver +
                '}';
    }
}
