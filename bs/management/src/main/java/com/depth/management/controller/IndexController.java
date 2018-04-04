package com.depth.management.controller;

import com.depth.management.model.Emp;
import com.depth.management.service.EmpService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class IndexController {

    private final EmpService empService;

    public IndexController(EmpService empService) {
        this.empService = empService;
    }

    @GetMapping("/index")
    public List<Emp> index() {
        return empService.findAll();
    }

    @GetMapping("/save")
    public Emp insert(Emp emp) {
        return empService.save(emp);
    }
}
