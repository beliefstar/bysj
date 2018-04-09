package com.depth.management.controller;

import com.depth.management.service.SysObjectService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    private final SysObjectService sysObjectService;

    @Autowired
    public IndexController(SysObjectService sysObjectService) {
        this.sysObjectService = sysObjectService;
    }

    @GetMapping({"/", "/index"})
    public String index(ModelMap modelMap, LoginInfo loginInfo) {
        modelMap.put("moduleList", sysObjectService.findModule(loginInfo.getEmp().getId()));
        return "index";
    }

}
