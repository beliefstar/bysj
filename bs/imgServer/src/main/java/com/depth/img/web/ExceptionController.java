package com.depth.img.web;

import com.depth.img.common.Result;
import com.depth.img.common.ServiceException;
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

}
