package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.*;

/**
 * 薪资表
 */
@Table(name = "salary")
public class Salary extends BaseEntity {
    private static final long serialVersionUID = -1541866412273171355L;

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
     * 基本工资
     */
    private Integer base;
    /**
     * 奖金
     */
    private Integer bonus;
    /**
     * 补贴
     */
    private Integer subsidy;
    /**
     * 备注信息
     */
    private String comment;

    public Salary() {
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

    public Integer getBase() {
        return base;
    }

    public void setBase(Integer base) {
        this.base = base;
    }

    public Integer getBonus() {
        return bonus;
    }

    public void setBonus(Integer bonus) {
        this.bonus = bonus;
    }

    public Integer getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(Integer subsidy) {
        this.subsidy = subsidy;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", empId=" + empId +
                ", base=" + base +
                ", bonus=" + bonus +
                ", subsidy=" + subsidy +
                ", comment='" + comment + '\'' +
                '}';
    }
}
