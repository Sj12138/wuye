package cn.com.wy.service;

import cn.com.wy.entity.Post;

import java.util.List;

public interface PostService {

    /**
     * 查询所有职位
     * @return
     */
    List<Post> findAll();

    /**
     * 根据职位Id查询
     * @param postId
     * @return
     */
    Post findByPostId(int postId);

    /**
     * 根据职位名称查询，支持模糊查询
     * @param PostName
     * @return
     */
    List<Post> findByPostName(String PostName);

    /**
     * 修改职位
     * @param post
     * @return
     */
    boolean updatePost(Post post);

    /**
     * 新增职位
     * @param post
     * @return
     */
    boolean addPost(Post post);

    /**
     * 删除职位
     * @param postId
     * @return
     */
    boolean delete(int postId);
}
