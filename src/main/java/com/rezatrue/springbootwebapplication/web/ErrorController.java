package com.rezatrue.springbootwebapplication.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller("error")
public class ErrorController {
	
	public ModelAndView handleError(HttpServletRequest request, Exception ex) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("exception, ex");
		mv.addObject("url", request.getRequestURL());
		
		mv.setViewName("error");
		
		return mv;
	}

}
