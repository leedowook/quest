package kr.co.hospital.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

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
import kr.co.hospital.vo.*;
import kr.co.hospital.service.userService;

@RequestMapping(value="/user")
@Controller
public class userController {
	@Autowired userService service;
	
	@GetMapping("/loginhome")
	public  String loginHome(Principal principal) {
		
		return "user/include/sidebar";
	}
	@PostMapping("/userInput")
	public String userInput(@ModelAttribute userVo user,Model model){
		service.userInput(user);
		return "user/admin/home";
	}
	
	@GetMapping("/list")
	public String userList(Model model) {
		userVo user=new userVo();
		service.userInput(user);
		return "user/manageUser";
	}


}
