package kr.co.pro.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		System.out.println("�α��� �������� �̵�");
		return "user/normal/login";
	}
	
	@GetMapping("/register")
	public  String register() {
		System.out.println("ȸ������ ��������� �̵� ");
		
		return "user/admin/register";
	}
	@PostMapping("/registeraction")
	public ModelAndView register(@ModelAttribute userVo user,ModelAndView model){
		
		model=userser.userRegister(user, model);
	
		return model;
	}
	
	@PostMapping("/registerModify")
	public ModelAndView registerModify(@ModelAttribute String id,ModelAndView model){
		
		model=userser.userInfo(id, model);
		model.setViewName("user/admin/registerChange");
		return model;
	}
	
	
	@PostMapping("/idOverlap")
	@ResponseBody
	public int Overlap(@RequestParam("id") String id,int result){
		userser.idOverlap(id,result);
		return result;
	}
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model) {
		System.out.println("ȸ�� ����Ʈ ��� �������� �̵� ");
		userser.getTableInfo(model);
		return model;
		
	}
	@PostMapping("/modify")
	public String modify() {
		return "user/admin/modify";
		
	} 
	@PostMapping("/info")
	public String info() {
		return "user/admin/info";
		
	} 
}
