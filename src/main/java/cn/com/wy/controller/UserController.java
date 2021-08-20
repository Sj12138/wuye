package cn.com.wy.controller;

import cn.com.wy.entity.User;
import cn.com.wy.service.UserService;
import com.alibaba.druid.util.StringUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前台控制器
 * 
 *
 */
@RequestMapping("/user")
@Controller
@SessionAttributes({"userName","userId","roleId"})
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 系统的首页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method= RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		model.setViewName("system/login");
		return model;
	}

	/**
	 *           		调用userService的login方法判断，查询出值后需向session域中传递name为"userId"，值为user.getuserId、name为"roleId(权限)"
	 *           		值为"user.state"、name为"userName"值为"user.userName"的;
	 * @param user   	根据user对象传递的userName和userPwd判断
	 * @param cpacha    这个是验证码，留在这里后续再写
	 * @return			验证成功重定向到home/list 失败则返回原页面system/login
	 */
	@PostMapping("login")
	public String login(User user, String cpacha, Model model){
		User bool = userService.login(user);
		if(bool != null){
			model.addAttribute("userName",bool.getUserName());
			model.addAttribute("userId",bool.getUserId());
			model.addAttribute("roleId",bool.getUserState());
			return "redirect:../home/list";
		}else{
			return "system/login";
		}
	}
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(User user){
		Map<String, Object> ret = new HashMap<String, Object>();
		List<User> userList = userService.findUser(user);
		ret.put("rows", userList);
		return ret;
	}

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(User user){
		Map<String, String> ret = new HashMap<String, String>();
		if(user == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的用户信息！");
			return ret;
		}
		if(StringUtils.isEmpty(user.getUserName())){
			ret.put("type", "error");
			ret.put("msg", "请填写用户名！");
			return ret;
		}
		if(StringUtils.isEmpty(user.getUserPwd())){
			ret.put("type", "error");
			ret.put("msg", "请填写密码！");
			return ret;
		}
		if(StringUtils.isEmpty(user.getUserNum())){
			ret.put("type", "error");
			ret.put("msg", "请填写账号！");
			return ret;
		}
		if(user.getUserState() == -1){
			ret.put("type", "error");
			ret.put("msg", "请选择所属角色！");
			return ret;
		}
		if(!userService.addUser(user)){
			ret.put("type", "error");
			ret.put("msg", "用户添加失败");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "角色添加成功！");
		return ret;
	}

	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(User user){
		System.out.println(user);
		Map<String, String> ret = new HashMap<String, String>();
		if(user == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的用户信息！");
			return ret;
		}
		if(StringUtils.isEmpty(user.getUserName())){
			ret.put("type", "error");
			ret.put("msg", "请填写用户名！");
			return ret;
		}
		if(user.getUserState() == -1){
			ret.put("type", "error");
			ret.put("msg", "请选择所属角色！");
			return ret;
		}
		if(!userService.updateUser(user)){
			ret.put("type", "error");
			ret.put("msg", "用户添加失败！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "角色添加成功！");
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
		boolean bool = userService.deleteUser(listId);
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
