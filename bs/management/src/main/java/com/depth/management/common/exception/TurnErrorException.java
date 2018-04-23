package com.depth.management.common.exception;

public class TurnErrorException extends RuntimeException {
    private static final long serialVersionUID = -2046765415906015319L;

    public TurnErrorException() {
    }

    public TurnErrorException(String message) {
        super(message);
    }
}
