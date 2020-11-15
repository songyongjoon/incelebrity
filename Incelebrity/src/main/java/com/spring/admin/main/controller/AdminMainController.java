package com.spring.admin.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMainController {
<<<<<<< HEAD
	final static Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
=======
    final static Logger logger = LoggerFactory.getLogger(AdminMainController.class);

    @RequestMapping(value="/admin", method= RequestMethod.GET)
    public String main(){
        return "main";
    }
>>>>>>> branch 'master' of https://github.com/songyongjoon/teamProject.git
}
