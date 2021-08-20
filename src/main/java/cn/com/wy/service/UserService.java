package cn.com.wy.service;

import cn.com.wy.entity.*;

import java.util.List;

/**
 * 物业人员
 */
public interface UserService {
    /**
     * 首先根据user里面的userNum查询用户对象，如果为空则查询失败，返回false
     * 如果查询到了，根据查询到的user对象对比传过来的user对象的userPsw，如果相同返回true
     * 不同返回false
     * @param user
     * @return
     */
    User login(User user);

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
    boolean updateUser(User user);

    /**
     * 根据userId删除数据库对应数据
     * @param ids
     * @return
     */
    boolean deleteUser(List<Integer> ids);

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
    boolean addUser(User user);
}
