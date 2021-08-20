package cn.com.wy.test;

import cn.com.wy.entity.User;
import cn.com.wy.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestUserService {
    private UserService userService;
    @Before
    public void init(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        userService = applicationContext.getBean(UserService.class);
    }
    @Test
    public void findAllUser(){
        List<User> userList = userService.findAllUser();
        for(User user : userList){
            System.out.println(user);
        }
    }
}
