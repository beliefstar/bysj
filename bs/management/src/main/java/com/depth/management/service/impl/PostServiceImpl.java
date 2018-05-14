package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.PostMapper;
import com.depth.management.model.Post;
import com.depth.management.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostMapper postMapper;

    @Override
    public List<Post> findAll() {
        List<Post> list;
        try {
            list = postMapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return list;
    }

    @Override
    public void save(Post post) {
        try {
            postMapper.insert(post);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public void update(Post post) {
        if (post.getId() == null) return;
        postMapper.updateByPrimaryKeySelective(post);
    }

    @Override
    public void delete(Integer id) {
        postMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Post findById(Integer id) {
        return postMapper.selectByPrimaryKey(id);
    }

    @Override
    public Post findByName(String post) {
        List<Post> all = findAll();
        for (Post p : all) {
            if (p.getPost().equals(post)) {
                return p;
            }
        }
        return null;
    }
}
