package com.depth.management.common.vo;

import java.io.Serializable;
import java.util.Date;

public class AnaSalaryVo implements Serializable {
    private static final long serialVersionUID = -8317655753078965026L;

    private Double avg;

    private Date createTime;

    public AnaSalaryVo() {
    }

    public Double getAvg() {
        return avg;
    }

    public void setAvg(Double avg) {
        this.avg = avg;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
