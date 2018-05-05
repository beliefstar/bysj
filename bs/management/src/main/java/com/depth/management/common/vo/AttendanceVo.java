package com.depth.management.common.vo;

import com.depth.management.model.Emp;

import java.io.Serializable;

public class AttendanceVo implements Serializable {

    private static final long serialVersionUID = -8279185131282770179L;

    private Long empId;

    private Emp emp;

    private Integer lastNumber;

    private Integer leaveNumber;

    private Integer outNumber;

    public AttendanceVo() {
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Integer getLastNumber() {
        return lastNumber;
    }

    public void setLastNumber(Integer lastNumber) {
        this.lastNumber = lastNumber;
    }

    public Integer getLeaveNumber() {
        return leaveNumber;
    }

    public void setLeaveNumber(Integer leaveNumber) {
        this.leaveNumber = leaveNumber;
    }

    public Integer getOutNumber() {
        return outNumber;
    }

    public void setOutNumber(Integer outNumber) {
        this.outNumber = outNumber;
    }

    @Override
    public String toString() {
        return "AttendanceVo{" +
                "emp=" + emp +
                ", lastNumber=" + lastNumber +
                ", leaveNumber=" + leaveNumber +
                '}';
    }
}
