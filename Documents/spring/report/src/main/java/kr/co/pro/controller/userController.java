package kr.co.pro.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import kr.co.pro.vo.*;
import kr.co.pro.service.userService;

@RequestMapping(value="/User")
@Controller
public class userController {
	@Autowired userService userser;
	
	@GetMapping("/loginhome")
	public  String loginHome(Principal principal) {
		
		System.out.println("로그인 창으로이동");
		return "user/include/sidebar";
	}
	
	@GetMapping("/register")
	public  String register() {
		System.out.println("가입 페이지로 이동 ");
		
		return "user/admin/register";
	}
	@PostMapping("/registeraction")
	@ResponseBody
	public Map<String,Object> register(@ModelAttribute userVo user,Object result){
		Map<String,Object> ajaxdata=new HashMap<String,Object>();
		result=userser.userRegister(user);
		
		ajaxdata.put("data", result);
		return ajaxdata;
	}
	
	@GetMapping("/registerModify")
	public ModelAndView registerModify(@RequestParam String id){
		ModelAndView model=new ModelAndView();
		System.out.println("변경페이지 접근중"+id);
		model=userser.userInfo(id, model);
		model.setViewName("user/admin/registerChange");
		return model;
	}
	@PostMapping("/registerModifyAction")
	public String registerModifyAtion(@ModelAttribute userVo user){
		userser.userModify(user);
		return "redirect:/User/list";
	}
	
	
	@GetMapping("/idOverlap")
	@ResponseBody
	public int Overlap(@RequestParam (value="id",required=false)String id){
		int result=userser.idOverlap(id);
		return result;
	}
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model) {
		System.out.println("유저 목록 페이지로 이동 ");
		userser.getTableInfo(model);
		return model;
		
	}
	@PostMapping("/userdelete")
	@ResponseBody
	public Map<String,Object> delete(@ModelAttribute("id_del") String id_del,Object result) {
		System.out.println("삭제");
		Map<String,Object> ajaxdata=new HashMap<String,Object>();
		result=userser.userDelete(id_del);
		ajaxdata.put("data", result);
		return ajaxdata;
		
	} 
	
	@GetMapping("/selectUserTable")
	@ResponseBody
	public Map<String,Object> selectUserTable(@ModelAttribute selectVo select) {
		Map<String,Object> result=new HashMap<String,Object>();
		System.out.println("조회"+select.getOption1());
		userser.userSelectTable(select,result);
		System.out.println(result);
		return result;
	}

}
