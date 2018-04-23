package com.depth.management.model;

import com.depth.management.common.BaseEntity;
import org.springframework.util.StringUtils;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 招聘表
 */
@Table(name = "invite_post")
public class InvitePost extends BaseEntity {
    private static final long serialVersionUID = 7145522640284366838L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;
    /**
     * 处理结果 - 0: 新建、1: 已完成、 2: 已拒绝
     */
    private String status;
    /**
     * 审批人
     */
    private Long approver;
    /**
     * 入职时间
     */
    private Date entryTime;

    public InvitePost() {
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

    public String getStatus() {
        return StringUtils.isEmpty(status) ? null : status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getApprover() {
        return approver;
    }

    public void setApprover(Long approver) {
        this.approver = approver;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    @Override
    public String toString() {
        return "InvitePost{" +
                "id=" + id +
                ", empId=" + empId +
                ", status='" + status + '\'' +
                ", approver=" + approver +
                ", entryTime=" + entryTime +
                '}';
    }
}
