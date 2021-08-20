package cn.com.wy.dao;

import cn.com.wy.entity.User;

import java.util.List;

/**
 * User
 */
public interface UserDao {
    /**
     * 查询所有User
     * @return
     */
    List<User> findAllUser();
    /**
     * 根据userId查询user对象
     * @param userId
     * @return
     */
    User findByUserId(int userId);

    /**
     * 根据账号查询user对象
     * @param userNum
     * @return
     */
    User findByUserNum(String userNum);

    /**
     * 根据职位id查询
     * @param postId
     * @return
     */
    List<User> findByPostId(int postId);

    /**
     * 根据传入的user对象修改原有数据
     * @param user
     * @return
     */
    int updateUser(User user);

    /**
     * 根据userId删除数据库对应数据
     * @param ids
     * @return
     */
    int deleteUser(List<Integer> ids);

    /**
     * 根据userName查询user对象
     * @param userName
     * @return
     */
    List<User> findByUserName(String userName);

    /**
     * 模糊查询,如果为null或者0则不加入此列
     * @param user
     * @return
     */
    List<User> findUser(User user);

    /**
     * 新增User
     * @param user
     * @return
     */
    int addUser(User user);
}
