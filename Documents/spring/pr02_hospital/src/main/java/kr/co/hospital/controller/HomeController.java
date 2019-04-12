package kr.co.hospital.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	@GetMapping("/")
	public String Home() {
		return "admin/home";
		
	}
	@GetMapping("/calender")
	public String calender() {
		return "admin/calender";
	}
	@GetMapping("/table")
	public String table() {
		return "admin/datatable";
	}
	@GetMapping("/chart")
	public String chart() {
		return "admin/chart";
	}
	@GetMapping("/chart2")
	public String chart2() {
		return "admin/chart2";
	}
	@GetMapping("/nav")
	public String nav() {
		return "include/nav";
	}


	
}
