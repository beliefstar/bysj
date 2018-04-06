package com.depth.management.common.exception;

public class ServiceException extends RuntimeException {
    private static final long serialVersionUID = 2975017372986892653L;

    public ServiceException() {
    }

    public ServiceException(String message) {
        super(message);
    }
}
