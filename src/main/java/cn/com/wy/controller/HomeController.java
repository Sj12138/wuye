package cn.com.wy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home")
public class HomeController {
    /**
     * 登陆成功后需要显示数据，默认显示业主与楼房关系（userList）返回给前端
     * 调用UserService的findAllUser方法
     * @Model 中返回
     */
    @RequestMapping("list")
    public String list(){
        return "system/index";
    }
    @RequestMapping("welcome")
    public String welcome(){
        return "system/welcome";
    }
    @RequestMapping("rudList")
    public String rudList(){
        return "rud/list";
    }
    @RequestMapping("login")
    public String login(){
        return "system/login";
    }
}
