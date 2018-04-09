package com.depth.management.common.vo;

import java.io.Serializable;

public class Result implements Serializable {
    private static final long serialVersionUID = -2492824255556922073L;

    private Integer status;

    private String message;

    private Object data;

    public Result() {
        this.status = 200;
        this.message = "OK";
    }

    public Result(Object data) {
        this();
        this.data = data;
    }

    public Result(Integer status, String message) {
        this.status = status;
        this.message = message;
    }

    public Result(Integer status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
