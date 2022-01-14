package cosmo.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/consultation/*")
public class ConsultaionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConsultaionController.class);
	
	@GetMapping("/page")
	public String list(Model model) throws Exception{
		logger.info("consultationpage...");
		
		return "layout/consultation/page";
	}
	
}