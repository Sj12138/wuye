package cn.com.wy.controller;

import cn.com.wy.entity.Head;
import cn.com.wy.entity.User;
import cn.com.wy.service.HeadService;
import com.alibaba.druid.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("head")
public class HeadController {
    @Autowired
    private HeadService headService;
    @RequestMapping("/list1")
    public String list(){
        return "head/list";
    }
    @RequestMapping(value="/list",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(Head head){
        Map<String, Object> ret = new HashMap<String, Object>();
        List<Head> headList = headService.findHead(head);
        ret.put("rows", headList);
        return ret;
    }

    /**
     * 添加业主
     * @param head
     * @return
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> add(Head head){
        Map<String, String> ret = new HashMap<String, String>();
        if(head == null){
            ret.put("type", "error");
            ret.put("msg", "请填写正确的用户信息！");
            return ret;
        }
        if(StringUtils.isEmpty(head.getHeadName())){
            ret.put("type", "error");
            ret.put("msg", "请填写姓名！");
            return ret;
        }
        if(head.getHeadCard()==null){
            ret.put("type", "error");
            ret.put("msg", "请填写身份证号码！");
            return ret;
        }
        if(head.getHeadPhone() == null){
            ret.put("type", "error");
            ret.put("msg", "请填写手机号码！");
            return ret;
        }
        if(head.getHeadSex() == null){
            ret.put("type", "error");
            ret.put("msg", "请选择性别！");
            return ret;
        }
        if(!headService.addHead(head)){
            ret.put("type", "error");
            ret.put("msg", "用户添加失败");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "业主添加成功！");
        return ret;
    }

    /**
     * 修改用户
     * @param head
     * @return
     */
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> edit(Head head){
        Map<String, String> ret = new HashMap<String, String>();
        if(head == null){
            ret.put("type", "error");
            ret.put("msg", "请填写正确的用户信息！");
            return ret;
        }
        if(head == null){
            ret.put("type", "error");
            ret.put("msg", "请填写正确的用户信息！");
            return ret;
        }
        if(StringUtils.isEmpty(head.getHeadName())){
            ret.put("type", "error");
            ret.put("msg", "请填写姓名！");
            return ret;
        }
        if(head.getHeadCard()==null){
            ret.put("type", "error");
            ret.put("msg", "请填写身份证号码！");
            return ret;
        }
        if(head.getHeadPhone() == null){
            ret.put("type", "error");
            ret.put("msg", "请填写手机号码！");
            return ret;
        }
        if(head.getHeadSex() == null){
            ret.put("type", "error");
            ret.put("msg", "请选择性别！");
            return ret;
        }
        if(!headService.updateHead(head)){
            ret.put("type", "error");
            ret.put("msg", "业主修改失败！");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "业主添加成功！");
        return ret;
    }

    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> delete(String ids){
        Map<String, String> ret = new HashMap<String, String>();
        if(StringUtils.isEmpty(ids)){
            ret.put("type", "error");
            ret.put("msg", "选择要删除的数据！");
            return ret;
        }
        String[] s = ids.split(",");
        List<Integer> listId = new ArrayList<>();
        for(String id : s){
            listId.add(Integer.valueOf(id));
        }
        boolean bool = headService.deleteHead(listId);
        if(!bool){
            ret.put("type", "error");
            ret.put("msg", "删除失败或部分删除失败");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "用户删除成功！");
        return ret;
    }
}
