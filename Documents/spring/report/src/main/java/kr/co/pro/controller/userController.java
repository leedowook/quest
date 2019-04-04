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
import org.springframework.web.servlet.ModelAndView;
import kr.co.pro.vo.*;
import kr.co.pro.service.userService;

@RequestMapping(value="/User")
@Controller
public class userController {
	@Autowired userService userser;
	
	@GetMapping("/loginhome")
	public  String loginHome(Principal principal) {
		
		System.out.println("로그인 페이지로 이동");
		return "user/normal/login";
	}
	
	@GetMapping("/register")
	public  String register() {
		System.out.println("회원정보 등록페이지 이동 ");
		
		return "user/admin/register";
	}
	@PostMapping("/registeraction")
	public ModelAndView register(@ModelAttribute userVo user,ModelAndView model){
		
		model=userser.userRegister(user, model);
	
		return model;
	}
	
	
	@PostMapping("/idOverlap")
	public void Overlap(){
		userser.idOverlap();
	}
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model) {
		System.out.println("회원 리스트 출력 페이지로 이동 ");
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
