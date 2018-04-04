package com.depth.management.model;

import com.depth.management.common.BaseEntity;
import com.sun.xml.internal.bind.v2.model.core.ID;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 历史薪资表
 */
@Table(name = "salary_history")
public class SalaryHistory extends BaseEntity {
    private static final long serialVersionUID = -1538135001203921557L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;
    /**
     * 薪资
     */
    private Double salary;
    /**
     * 备注
     */
    private String comment;

    public SalaryHistory() {
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

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "SalaryHistory{" +
                "id=" + id +
                ", empId=" + empId +
                ", salary=" + salary +
                ", comment='" + comment + '\'' +
                '}';
    }
}
