package cn.com.wy.test;

import cn.com.wy.dao.CommServiceDao;
import cn.com.wy.entity.CommServiceEntity;
import cn.com.wy.entity.Rud;
import cn.com.wy.entity.User;
import cn.com.wy.service.RudService;
import cn.com.wy.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestUserService {
    private RudService rudService;
    @Before
    public void init(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        rudService = applicationContext.getBean(RudService.class);
    }
    @Test
    public void findAllUser(){
        List<Rud> rudList = rudService.findRid();
        for(Rud rud : rudList){
            System.out.println(rud);
        }
        List<Rud> rudList1 = rudService.findUn();
        for(Rud rud : rudList1){
            System.out.println(rud);
        }
        List<Rud> rudList2 = rudService.findDp();
        for(Rud rud : rudList2){
            System.out.println(rud);
        }
    }
}
