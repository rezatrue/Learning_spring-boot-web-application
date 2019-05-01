package com.rezatrue.springbootwebapplication.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	@ResponseBody
	public String Login() {
		return "Welcome to Spring Web app";
	}

}
