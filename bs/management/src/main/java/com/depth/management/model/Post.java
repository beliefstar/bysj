package com.depth.management.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "post")
public class Post implements Serializable {
    private static final long serialVersionUID = -3526425314090325665L;

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY, generator="Mysql")
    private Integer id;
    private String post;
    private Integer salary;

    public Post() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", post='" + post + '\'' +
                ", salary=" + salary +
                '}';
    }
}
