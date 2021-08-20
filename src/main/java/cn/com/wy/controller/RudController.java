package cn.com.wy.controller;

import cn.com.wy.entity.Rud;
import cn.com.wy.entity.User;
import cn.com.wy.service.RudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("rud")
public class RudController {
    @Autowired
    private RudService rudService;
    @RequestMapping(value="/list",method= RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Rud rud){
        Map<String, Object> ret = new HashMap<String, Object>();
        List<Rud> rudList = rudService.findRud(rud);
        ret.put("rows", rudList);
        for(Rud rud1 : rudList){
            System.out.println(rud1);
        }
        return ret;
    }
}
