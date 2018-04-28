package com.depth.management.model;

import com.depth.management.common.BaseEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * 岗位调整申请表
 */
@Table(name = "adjustment_apply")
public class AdjustmentApply extends BaseEntity {
    private static final long serialVersionUID = -7682288040491363796L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 员工ID
     */
    private Long empId;
    /**
     * 员工名
     */
    @Transient
    private String empName;
    /**
     * 申请时间
     */
    private Date applyTime;
    /**
     * 申请原因
     */
    private String text;
    /**
     * 源部门ID
     */
    private Long origin;
    @Transient
    private String originName;
    /**
     * 到达部门ID
     */
    private Long arrive;
    @Transient
    private String arriveName;
    /**
     * 申请状态- 0: 新申请、1: 原部门主管同意、2: 原部门拒绝、3: 到达部门同意、4:到达部门拒绝
     */
    private String status;
    /**
     * 原部门主管处理时间
     */
    private Date originDealTime;
    /**
     * 原部门审批人
     */
    private Long originApprove;
    @Transient
    private String originApproveName;
    /**
     * 原部门备注
     */
    private String originComment;
    /**
     * 到达部门审批时间
     */
    private Date arriveDealTime;
    /**
     * 到达部门审批人
     */
    private Long arriveApprove;
    @Transient
    private String arriveApproveName;
    /**
     * 到达部门备注
     */
    private String arriveComment;

    public AdjustmentApply() {
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    public String getArriveName() {
        return arriveName;
    }

    public void setArriveName(String arriveName) {
        this.arriveName = arriveName;
    }

    public String getOriginApproveName() {
        return originApproveName;
    }

    public void setOriginApproveName(String originApproveName) {
        this.originApproveName = originApproveName;
    }

    public String getArriveApproveName() {
        return arriveApproveName;
    }

    public void setArriveApproveName(String arriveApproveName) {
        this.arriveApproveName = arriveApproveName;
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

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getOrigin() {
        return origin;
    }

    public void setOrigin(Long origin) {
        this.origin = origin;
    }

    public Long getArrive() {
        return arrive;
    }

    public void setArrive(Long arrive) {
        this.arrive = arrive;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOriginDealTime() {
        return originDealTime;
    }

    public void setOriginDealTime(Date originDealTime) {
        this.originDealTime = originDealTime;
    }

    public Long getOriginApprove() {
        return originApprove;
    }

    public void setOriginApprove(Long originApprove) {
        this.originApprove = originApprove;
    }

    public String getOriginComment() {
        return originComment;
    }

    public void setOriginComment(String originComment) {
        this.originComment = originComment;
    }

    public Date getArriveDealTime() {
        return arriveDealTime;
    }

    public void setArriveDealTime(Date arriveDealTime) {
        this.arriveDealTime = arriveDealTime;
    }

    public Long getArriveApprove() {
        return arriveApprove;
    }

    public void setArriveApprove(Long arriveApprove) {
        this.arriveApprove = arriveApprove;
    }

    public String getArriveComment() {
        return arriveComment;
    }

    public void setArriveComment(String arriveComment) {
        this.arriveComment = arriveComment;
    }

    @Override
    public String toString() {
        return "AdjustmentApply{" +
                "id=" + id +
                ", empId=" + empId +
                ", applyTime=" + applyTime +
                ", text='" + text + '\'' +
                ", origin=" + origin +
                ", arrive=" + arrive +
                ", status=" + status +
                ", originDealTime=" + originDealTime +
                ", originApprove=" + originApprove +
                ", originComment='" + originComment + '\'' +
                ", arriveDealTime=" + arriveDealTime +
                ", arriveApprove=" + arriveApprove +
                ", arriveComment='" + arriveComment + '\'' +
                '}';
    }
}
