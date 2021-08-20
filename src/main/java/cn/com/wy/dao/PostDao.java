package cn.com.wy.dao;

import cn.com.wy.entity.Post;

import java.util.List;

/**
 * 职位
 */
public interface PostDao {
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
    int updatePost(Post post);

    /**
     * 新增职位
     * @param post
     * @return
     */
    int addPost(Post post);

    /**
     * 删除职位
     * @param postId
     * @return
     */
    int delete(int postId);

}
