package com.depth.management.model.example;

import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.model.InvitePost;

import java.io.Serializable;
import java.util.Date;

public class InvitePostExample implements Serializable {
    private static final long serialVersionUID = -5903524877293170663L;

    private Long id;
    private Emp emp;
    private Department empDepartment;
    /**
     * 处理结果 - 0: 新建、1: 已完成、 2: 已拒绝
     */
    private String status;
    /**
     * 审批人
     */
    private Emp approver;

    /**
     * 入职时间
     */
    private Date entryTime;

    public InvitePostExample() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Emp getApprover() {
        return approver;
    }

    public void setApprover(Emp approver) {
        this.approver = approver;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public Department getEmpDepartment() {
        return empDepartment;
    }

    public void setEmpDepartment(Department empDepartment) {
        this.empDepartment = empDepartment;
    }

    public static InvitePostExample from(InvitePost invitePost) {
        InvitePostExample example = new InvitePostExample();
        example.setId(invitePost.getId());
        example.setEntryTime(invitePost.getEntryTime());
        example.setStatus(invitePost.getStatus());
        return example;
    }
}
