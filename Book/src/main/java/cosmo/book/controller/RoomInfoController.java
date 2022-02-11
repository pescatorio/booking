package cosmo.book.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cosmo.book.service.BookingService;
import cosmo.book.service.OptionsService;
import cosmo.book.service.RoomInfoService;
import cosmo.book.service.SliderImagesService;
import cosmo.book.vo.BookingVO;
import cosmo.book.vo.ImageFile;
import cosmo.book.vo.RoomInfoVO;

@Controller
@RequestMapping("/roomInfo/*")
public class RoomInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomInfoController.class);
	
	@Autowired
	RoomInfoService rService;
	@Autowired
	SliderImagesService sService;
	@Autowired
	OptionsService oService;
	@Autowired
	BookingService bService;
	
	@GetMapping("/page")
	public String list(Model model) throws Exception{
		logger.info("roomInfoPage...");
		List<RoomInfoVO> rList = rService.selectRoomInfoListAtHome();
		System.out.println(rList);
		for(int i=0; i<rList.size();i++) {
			ImageFile iFile= new ImageFile(rList.get(i).getImages());
			ArrayList <String>tmpList= new ArrayList<String>();
			for(int o=0;o<iFile.getImageFile().size();o++) {
				tmpList.add(sService.selectimage(Integer.parseInt(iFile.getImageFile().get(o))).getFile_name());
			}
			rList.get(i).setTmpImages(tmpList);
			List<String> list = bService.selectPeriod(rList.get(i).getNo());
			rList.get(i).setStartToEnd(list);
		}
		
		model.addAttribute("rList",rList); 
		model.addAttribute("oList",oService.selectOptionsList());
		return "layout/roomInfo/page";
	}
	
	@PostMapping("/insertBookingProgress")
	public String insertBooking(BookingVO bVo) throws Exception{
		logger.info("insertBooking...");
		System.out.println(bVo);
		bService.insertBooking(bVo);
		return "redirect:/";
	}
	
}