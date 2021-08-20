package cn.com.wy.service.Impl;

import cn.com.wy.dao.UserDao;
import cn.com.wy.entity.User;
import cn.com.wy.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    /**
     * 首先根据user里面的userNum查询用户对象，如果为空则查询失败，返回false
     * 如果查询到了，根据查询到的user对象对比传过来的user对象的userPsw，如果相同返回true
     * 不同返回false
     * @param user
     * @return
     */
    public User login(User user) {
        User login = userDao.findByUserNum(user.getUserNum());
        if( login==null ) {
            return null;
        }
        if(user.getUserPwd().equals(login.getUserPwd())&&user.getUserState()==login.getUserState()) {
            return login;
        }
        return null;
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public User findByUserId(int userId) {
        return userDao.findByUserId(userId);
    }

    @Override
    public User findByUserNum(String userNum) {
        return userDao.findByUserNum(userNum);
    }

    @Override
    public List<User> findByPostId(int postId) {
        return userDao.findByPostId(postId);
    }

    @Override
    public boolean updateUser(User user) {
        boolean bool = false;
        int i = userDao.updateUser(user);
        if(i != 0){
            bool = true;
        }
        return bool;
    }

    @Override
    public boolean deleteUser(List<Integer> ids) {
        boolean bool = false;
        int i= userDao.deleteUser(ids);
        if(i != 0){
            bool = true;
        }
        return bool;
    }

    @Override
    public List<User> findByUserName(String userName) {
        return userDao.findByUserName(userName);
    }

    @Override
    public List<User> findUser(User user) {
        return userDao.findUser(user);
    }

    @Override
    public boolean addUser(User user) {
        boolean bool = false;
        int i = userDao.addUser(user);
        if (i > 0 ) {
            bool =true;
        }
        return bool;
    }
}
