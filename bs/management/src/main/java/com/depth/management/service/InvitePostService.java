package com.depth.management.service;

import com.depth.management.model.Emp;
import com.depth.management.model.InvitePost;

import java.util.List;

public interface InvitePostService {
    void save(InvitePost invitePost, String opa);
    List<InvitePost> findList(InvitePost invitePost);
    void access(Long empId, Emp loginEmp);

    void denied(Long empId, Emp loginEmp);
}
