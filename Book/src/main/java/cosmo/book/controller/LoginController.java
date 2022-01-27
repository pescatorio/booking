package cosmo.book.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/login")
	public String login(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminLogin...");
		
		return "/login/login";
	}
	
	@PostMapping("/loginProcess")
	public String loginProcess(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminMain...");
		String id = req.getParameter("id");
		String password=req.getParameter("password");
		if(id.equals("admin")&&password.equals("1234")) {
			return "redirect:admin/adminMain";
		}
		else return "/login/login";
	}
	
	
	
}