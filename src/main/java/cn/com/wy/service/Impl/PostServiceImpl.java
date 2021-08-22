package cn.com.wy.service.Impl;

import cn.com.wy.dao.PostDao;
import cn.com.wy.entity.Post;
import cn.com.wy.service.PostService;

import java.util.List;

public class PostServiceImpl implements PostService {
    private PostDao postDao;

    public void setPostDao(PostDao postDao) {
        this.postDao = postDao;
    }

    @Override
    public List<Post> findAll() {
        return postDao.findAll();
    }

    @Override
    public Post findByPostId(int postId) {
        return postDao.findByPostId(postId);
    }

    @Override
    public Post findByPostName(String PostName) {
        return postDao.findByPostName(PostName);
    }

    @Override
    public boolean updatePost(Post post) {
        boolean bool = false;
        try {
            int count = postDao.updatePost(post);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean addPost(Post post) {
        boolean bool = false;
        try {
            int count = postDao.addPost(post);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    @Override
    public boolean delete(int postId) {
        boolean bool = false;
        try {
            int count = postDao.delete(postId);
            if(count != 0){
                bool = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }
}
