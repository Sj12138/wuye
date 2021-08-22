package cn.com.wy.controller;

import cn.com.wy.entity.Head;
import cn.com.wy.entity.PropertyFee;
import cn.com.wy.entity.Rud;
import cn.com.wy.entity.User;
import cn.com.wy.service.RudService;
import com.alibaba.druid.util.StringUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("rud")
public class RudController {
    @Autowired
    private RudService rudService;
    @RequestMapping("/list1")
    public String list(Model model){
        model.addAttribute("rid",rudService.findRid());
        model.addAttribute("un",rudService.findUn());
        model.addAttribute("dp",rudService.findDp());
        return "rud/list";
    }
    @RequestMapping(value="/list",method= RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Rud rud){
        Map<String, Object> ret = new HashMap<String, Object>();
        List<Rud> rudList = rudService.findRud(rud);
        ret.put("rows", rudList);
        return ret;
    }
    /**
     * 添加rud
     * @param
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, String> add(Rud rud){
        Map<String, String> ret = new HashMap<String, String>();
        if(rud == null){
            ret.put("type", "error");
            ret.put("msg", "请填写正确的房屋信息！");
            return ret;
        }
        if(StringUtils.isEmpty(rud.getRudRidgepole())){
            ret.put("type", "error");
            ret.put("msg", "请填写栋数！");
            return ret;
        }
        if(StringUtils.isEmpty(rud.getRudUnit())){
            ret.put("type", "error");
            ret.put("msg", "请填写单元！");
            return ret;
        }
        if(StringUtils.isEmpty(rud.getRudDoorplate())){
            ret.put("type", "error");
            ret.put("msg", "请填写门牌号！");
            return ret;
        }
        if(!rudService.addRud(rud)){
            ret.put("type", "error");
            ret.put("msg", "房屋添加失败");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "房屋添加成功！");
        return ret;
    }
    /**
     * 批量删除房屋
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, String> delete(String ids){

        Map<String, String> ret = new HashMap<String, String>();
        if(StringUtils.isEmpty(ids)){
            ret.put("type", "error");
            ret.put("msg", "选择要删除的数据！");
            return ret;
        }
        String[] s = ids.split(",");
        List<Integer> listId = new ArrayList<Integer>();
        for(String id : s){
            listId.add(Integer.valueOf(id));
        }
        boolean bool = rudService.deleteRud(listId);
        if(!bool){
            ret.put("type", "error");
            ret.put("msg", "删除失败或部分删除失败");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "用户删除成功！");
        return ret;
    }
    @RequestMapping("/edit")
    @ResponseBody
    public Map<String, String> edit(Rud rud){
        Map<String, String> ret = new HashMap<String, String>();
        if(rud == null){
            ret.put("type", "error");
            ret.put("msg", "请填写正确的用户信息！");
            return ret;
        }
        if(StringUtils.isEmpty(rud.getRudRidgepole())){
            ret.put("type", "error");
            ret.put("msg", "请填房屋 栋数！");
            return ret;
        }
        if(StringUtils.isEmpty(rud.getRudUnit())){
            ret.put("type", "error");
            ret.put("msg", "请选择所属单元！");
            return ret;
        }

        if(StringUtils.isEmpty(rud.getRudDoorplate())){
            ret.put("type", "error");
            ret.put("msg", "请选择门牌号！");
            return ret;
        }


        if(!rudService.updateRud(rud)){
            ret.put("type", "error");
            ret.put("msg", "房屋添加失败！");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "房屋修改成功！");
        return ret;
    }
}


