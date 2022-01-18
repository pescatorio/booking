package cosmo.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cosmo.book.service.NoticeServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	NoticeServiceImpl nService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@GetMapping("/login")
	public String list(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminLogin...");
		
		return "adminlayout/admin/login";
	}
	
}