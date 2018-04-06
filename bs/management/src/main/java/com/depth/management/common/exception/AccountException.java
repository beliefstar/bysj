package com.depth.management.common.exception;

public class AccountException extends RuntimeException {
    private static final long serialVersionUID = 3650331228610250980L;

    public AccountException() {
    }

    public AccountException(String message) {
        super(message);
    }
}
