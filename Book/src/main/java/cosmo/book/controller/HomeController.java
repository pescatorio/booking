package cosmo.book.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cosmo.book.service.NoticeService;
import cosmo.book.service.RoomInfoService;
import cosmo.book.service.SliderImagesService;
import cosmo.book.vo.ImageFile;
import cosmo.book.vo.RoomInfoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	NoticeService nService;
	@Autowired
	SliderImagesService sService;
	@Autowired
	RoomInfoService rService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("home...");
		model.addAttribute("nList",nService.getListAtHome());
		List<RoomInfoVO> rList = rService.selectRoomInfoListAtHome();
		for(int i=0; i<rList.size();i++) {
			ImageFile iFile= new ImageFile(rList.get(i).getImages());
			rList.get(i).setImages(sService.selectimage(Integer.parseInt(iFile.getImageFile().get(0))).getFile_name());
		}
		model.addAttribute("rList",rList);
		
		model.addAttribute("imageList",sService.getSliderimagesListAtHome());
		return "layout/home";
	}
	
}
