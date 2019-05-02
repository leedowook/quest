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
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pro.dao.userDao;
import kr.co.pro.vo.*;

@Service
public class userService {
	
	@Autowired userDao dao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	public Object userRegister(userVo user){
		Object result=new Object();
        System.out.println(user.toString());
        System.out.println(user.getUser_crdate().getTime());
        user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));
		if(dao.userRegister(user)>0) {
			dao.userAthority(user);
			result=1;
			
		}
		else {
			result=2;
		}
		
		return result;
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

	public int userDelete(String id) {
		dao.authorityDelete(id);
		int result=dao.userDelete(id);
		return result;
	}

	public Map<String,Object> userSelectTable(selectVo select, Map<String,Object> result) {
		System.out.println(select.getIntoption1());
		select.setOption2("2");
		if(select.getOption1().equals("no")) {
			System.out.println("no");
			select.setOption1("0");
			select.setOption2("2");
		}
		else if(select.getOption1().equals("0")) {
			System.out.println("0");
			select.setOption1("0");
			select.setOption2("1");
		}
		else if(select.getOption1().equals("1")) {
			System.out.println("1");
			select.setOption1("1");
			select.setOption2("2");
		}
		
		System.out.println("test1"+select.getOption1());
		System.out.println("test2"+select.getOption2());
		System.out.println("test3"+select.getOption3());
		System.out.println("test4"+select.getInputOption());
		result.put("userList",dao.userSelectTable(select));
		result.put("userCount",dao.userSelectCount(select));
		
		return result;
		
	}
}
