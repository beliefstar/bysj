package com.depth.management.service;

import com.depth.management.model.Post;

import java.util.List;

public interface PostService {
    List<Post> findAll();

    void save(Post post);

    void update(Post post);

    void delete(Integer id);

    Post findById(Integer id);

    Post findByName(String post);
}
