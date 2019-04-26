package kr.co.hospital.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	@GetMapping("/")
	public String Home() {
		return "admin/home";
		
	}
	@GetMapping("/schMan")
	public String scheduleManagement() {
		return "admin/scheduleManagement";
	}
	@GetMapping("/table")
	public String table() {
		return "admin/datatable";
	}
	@GetMapping("/mesMan")
	public String messageManagement() {
		return "admin/messageManagement";
	}
	@GetMapping("/empMan")
	public String employeeManagement() {
		return "admin/employeeManagement";
	}
	@GetMapping("/salAna")
	public String saleAnalysis() {
		return "admin/saleAnalysis";
	}
	@GetMapping("/cusAna")
	public String customerAnalysis() {
		return "admin/customerAnalysis";
	}
	@GetMapping("/chart2")
	public String chart2() {
		return "admin/chart2";
	}
	@GetMapping("/nav")
	public String nav() {
		return "include/nav";
	}
	@GetMapping("/calendar")
	public String calendar() {
		return "admin/calendar";
	}
	@GetMapping("/datatable")
	public String datatable() {
		return "admin/datatable";
		
	}


	
}
