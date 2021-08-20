package cn.com.wy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("head")
public class HeadController {
    @RequestMapping("list")
    public String list(){
        return "user/list";
    }
}
