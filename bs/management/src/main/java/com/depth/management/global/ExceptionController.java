package com.depth.management.global;

import com.depth.management.common.vo.Result;
import com.depth.management.common.exception.AccountException;
import com.depth.management.common.exception.ServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result ExceptionHandler(Exception e) {
        return new Result(500, e.getMessage());
    }

    @ExceptionHandler(ServiceException.class)
    @ResponseBody
    public Result ServiceExceptionHandler(ServiceException e) {
        return new Result(500, e.getMessage());
    }

    @ExceptionHandler(AccountException.class)
    @ResponseBody
    public Result AccountExceptionHandler(AccountException e) {
        return new Result(500, e.getMessage());
    }
}
