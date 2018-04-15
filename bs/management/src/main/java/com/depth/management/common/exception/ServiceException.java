package com.depth.management.common.exception;

public class ServiceException extends RuntimeException {
    private static final long serialVersionUID = 2975017372986892653L;

    private Exception exception;

    public ServiceException() {
    }

    public ServiceException(Exception e) {
        exception = e;
    }

    public ServiceException(String message) {
        super(message);
    }

    @Override
    public String getMessage() {
        String message = super.getMessage();
        if (exception != null) {
            message = exception.getClass().getName() + " : " + exception.getMessage();
        }
        return message;
    }
}
