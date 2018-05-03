package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * 考勤表
 */
@Table(name = "attendance")
public class Attendance extends BaseEntity {

    private static final long serialVersionUID = -7996308356707681063L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;

    @Transient
    private Emp emp;
    /**
     * 上班时间
     */
    private Date startTime;
    /**
     * 下班时间
     */
    private Date endTime;

    private String dateUuid;

    public Attendance() {
    }

    public String getDateUuid() {
        return dateUuid;
    }

    public void setDateUuid(String dateUuid) {
        this.dateUuid = dateUuid;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "id=" + id +
                ", empId=" + empId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
