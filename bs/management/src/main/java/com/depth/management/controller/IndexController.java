package com.depth.management.controller;

import com.depth.management.common.vo.SysObjectTree;
import com.depth.management.model.Emp;
import com.depth.management.service.SysObjectService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    private final SysObjectService sysObjectService;

    @Autowired
    public IndexController(SysObjectService sysObjectService) {
        this.sysObjectService = sysObjectService;
    }

    @GetMapping({"/", "/index"})
    public String index(ModelMap modelMap, LoginInfo loginInfo) {
        final Emp emp = loginInfo.getEmp();

        List<SysObjectTree> module = sysObjectService.findModule(emp.getId());
        modelMap.put("moduleList", module);

        return "index";
    }

}
