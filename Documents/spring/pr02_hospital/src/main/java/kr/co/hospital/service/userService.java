package kr.co.hospital.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hospital.dao.userDao;
import kr.co.hospital.vo.*;

@Service
public class userService {
	
	@Autowired userDao dao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	public void userInput(userVo user){
		dao.userInput(user);
	}
	public userVo userSelect(String name) {
		userVo user=new userVo();
		user=dao.userSelect(name);
		return user;
		
	}
}
