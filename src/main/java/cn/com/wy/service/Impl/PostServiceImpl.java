package cn.com.wy.service.Impl;

import cn.com.wy.entity.Post;
import cn.com.wy.service.PostService;

import java.util.List;

public class PostServiceImpl implements PostService {
    @Override
    public List<Post> findAll() {
        return null;
    }

    @Override
    public Post findByPostId(int postId) {
        return null;
    }

    @Override
    public List<Post> findByPostName(String PostName) {
        return null;
    }

    @Override
    public boolean updatePost(Post post) {
        return false;
    }

    @Override
    public boolean addPost(Post post) {
        return false;
    }

    @Override
    public boolean delete(int postId) {
        return false;
    }
}
