package com.depth.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/analyze")
public class AnalyzeController {

    private String view(String str) {
        return "/analyze/" + str;
    }

    @GetMapping("/probability")
    public String probability() {
        return view("index");
    }
}
