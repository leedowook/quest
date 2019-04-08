package kr.co.pro.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pro.dao.userDao;
import kr.co.pro.vo.*;

@Service
public class userService {
	
	@Autowired userDao dao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	public ModelAndView userRegister(userVo user,ModelAndView model){
        System.out.println(user.toString());
        System.out.println(user.getUser_crdate().getTime());
        user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));
		if(dao.userRegister(user)>0) {
			dao.userAthority(user);
			model.addObject("result","1");
			
		}
		else {
			model.addObject("result","2");
		}
		model.setViewName("user/admin/register");
		return model;
	}
	
	public int idOverlap(String id) {
		int result=dao.idOverlap(id);
		System.out.println(result+"id"+id);
		return result;
		
	}
	public ModelAndView getTableInfo(ModelAndView model) {
	
		model.addObject("userList",dao.userList());
		model.addObject("userCount",dao.userCount());
		model.setViewName("user/admin/usertable");
		
		return model;
	}
	public void userModify(userVo user) {
		if(user.getUser_pw()==null) {
			
		}else {
			user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));
			dao.userUpdatePw(user);
		}
		System.out.println("확인service"+user.getUser_name());
		System.out.println("확인service2"+user.getUser_id());
		dao.userUpdate(user);
	}
	public ModelAndView userInfo(String id, ModelAndView model) {
		model.addObject("user",dao.userInfo(id));
		return model;
	}

	public void userDelete(String id) {
		dao.authorityDelete(id);
		dao.userDelete(id);
		
	}
}
