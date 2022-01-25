package cosmo.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cosmo.book.service.RoomInfoService;
import cosmo.book.service.RoomInfoServiceImpl;

@Controller
@RequestMapping("/roomInfo/*")
public class RoomInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomInfoController.class);
	
	@Autowired
	RoomInfoService rService;
	
	@GetMapping("/page")
	public String list(Model model) throws Exception{
		logger.info("roomInfoPage...");
		
		return "layout/roomInfo/page";
	}
	
}