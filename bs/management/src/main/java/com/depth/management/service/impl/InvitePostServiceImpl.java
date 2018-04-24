package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.InvitePostMapper;
import com.depth.management.model.Emp;
import com.depth.management.model.InvitePost;
import com.depth.management.service.InvitePostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class InvitePostServiceImpl implements InvitePostService {

    private final InvitePostMapper invitePostMapper;

    @Autowired
    public InvitePostServiceImpl(InvitePostMapper invitePostMapper) {
        this.invitePostMapper = invitePostMapper;
    }

    @Override
    public void save(InvitePost invitePost, String opa) {
        Date date = new Date();
        invitePost.setCreateTime(date);
        invitePost.setUpdateTime(date);
        invitePost.setCreateUser(opa);
        invitePost.setUpdateUser(opa);

        try {
            invitePostMapper.insert(invitePost);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public List<InvitePost> findList(InvitePost invitePost) {
        return invitePostMapper.select(invitePost);
    }

    @Override
    public void access(Long empId, Emp loginEmp) {
        try {
            invitePostMapper.access(loginEmp.getId(), loginEmp.getName(), empId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public void denied(Long empId, Emp loginEmp) {
        try {
            invitePostMapper.denied(loginEmp.getId(), loginEmp.getName(), empId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }
}
