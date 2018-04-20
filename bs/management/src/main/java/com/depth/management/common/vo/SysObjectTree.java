package com.depth.management.common.vo;

import com.depth.management.model.SysObject;

import java.util.List;

public class SysObjectTree extends SysObject {
    private static final long serialVersionUID = 4467832065930457004L;

    private List<SysObjectTree> list;

    public SysObjectTree() {
    }

    public List<SysObjectTree> getList() {
        return list;
    }

    public void setList(List<SysObjectTree> list) {
        this.list = list;
    }
}
