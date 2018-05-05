package com.depth.management.model;

import java.io.Serializable;
import java.util.Date;

public class Holiday implements Serializable {
    private static final long serialVersionUID = 3166980084355618397L;

    private Integer id;

    private Date weekDate;

    private String comment;

    public Holiday() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getWeekDate() {
        return weekDate;
    }

    public void setWeekDate(Date weekDate) {
        this.weekDate = weekDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Holiday{" +
                "id=" + id +
                ", weekDate=" + weekDate +
                ", comment='" + comment + '\'' +
                '}';
    }
}
