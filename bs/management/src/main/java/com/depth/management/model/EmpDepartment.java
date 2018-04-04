package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 员工-职位表
 */
@Table(name = "emp_department")
public class EmpDepartment extends BaseEntity {
    private static final long serialVersionUID = 9032350530415278330L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;
    /**
     * 部门ID
     */
    private Long departmentId;
    /**
     * 职位
     */
    private String post;

    public EmpDepartment() {
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

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "EmpDepartment{" +
                "id=" + id +
                ", empId=" + empId +
                ", departmentId=" + departmentId +
                ", post='" + post + '\'' +
                '}';
    }
}
