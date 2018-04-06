package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 员工表
 */
@Table(name = "emp")
public class Emp extends BaseEntity {
    private static final long serialVersionUID = 4046419998421780519L;
    public static final String SESSION_NAME = "_emp";
    /**
     * 工号
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long empId;
    /**
     * 姓名
     */
    private String name;
    /**
     * 年龄
     */
    private int age;
    /**
     * 性别
     */
    private String gender;
    /**
     * 入职时间
     */
    private Date joinTime;
    /**
     * 民族
     */
    private String nation;
    /**
     * 政治面貌
     */
    private String politics;
    /**
     * 家庭住址
     */
    private String address;
    /**
     * 生日
     */
    private Date birthday;
    /**
     * 电话1
     */
    private String phone1;
    /**
     * 电话2
     */
    private String phone2;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 毕业院校
     */
    private String school;
    /**
     * 学历
     */
    private String education;
    /**
     * 删除标志
     */
    private String delFlg;

    public Emp() {
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPolitics() {
        return politics;
    }

    public void setPolitics(String politics) {
        this.politics = politics;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getDelFlg() {
        return delFlg;
    }

    public void setDelFlg(String delFlg) {
        this.delFlg = delFlg;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", joinTime=" + joinTime +
                ", nation='" + nation + '\'' +
                ", politics='" + politics + '\'' +
                ", address='" + address + '\'' +
                ", birthday=" + birthday +
                ", phone1='" + phone1 + '\'' +
                ", phone2='" + phone2 + '\'' +
                ", email='" + email + '\'' +
                ", school='" + school + '\'' +
                ", education='" + education + '\'' +
                ", delFlg='" + delFlg + '\'' +
                '}';
    }
}
