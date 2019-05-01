package com.rezatrue.springbootwebapplication.web.service;

import org.springframework.stereotype.Component;

@Component
public class LoginService {
	
	public boolean validateUser(String name, String password) {
		// user ali password password
		return name.equalsIgnoreCase("ali") && password.equalsIgnoreCase("password");
	}

}
