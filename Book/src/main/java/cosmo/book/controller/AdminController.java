package cosmo.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cosmo.book.service.NoticeService;
import cosmo.book.service.RoomInfoService;
import cosmo.book.service.SliderImagesService;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;
import cosmo.book.vo.PageNavi;
import cosmo.book.vo.SliderimagesVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	NoticeService nService;
	@Autowired
	RoomInfoService rService;
	@Autowired
	SliderImagesService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@GetMapping("/adminMain")
	public String adminMain(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminMain...");
		
		return "adminlayout/admin/adminMain";
	}
	
	@PostMapping(value="/activityImageProgress",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<SliderimagesVO>activityImageProgress(Model model,@RequestParam("no")String no, @RequestParam("activity")String activity) throws Exception{
		logger.info("getImageAjax...");
		int tmpNo = Integer.parseInt(no);
		SliderimagesVO sVo= sService.selectimage(tmpNo);
		sVo.switchingActivity(activity);
		sService.updateSliderimages(sVo);
		sService.selectimage(tmpNo);
		return new ResponseEntity<SliderimagesVO>(sVo, HttpStatus.OK);
	}
	
	@PostMapping(value="/deleteImageProgress",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<SliderimagesVO>deleteImageProgress(Model model,@RequestParam("no")String no, @RequestParam("delete_flag")String delete_flag) throws Exception{
		logger.info("getImageAjax...");
		int tmpNo = Integer.parseInt(no);
		System.out.println("delete_flag.........."+delete_flag);
		System.out.println("no.........."+no);
		SliderimagesVO sVo= sService.selectimage(tmpNo);
		sVo.switchingDeleteFlag(delete_flag);
		System.out.println("sVo...."+sVo);
		sService.deleteFlagSliderimages(sVo);
		sService.selectimage(tmpNo);
		return new ResponseEntity<SliderimagesVO>(sVo, HttpStatus.OK);
	}
	
	
	//notice
	@GetMapping("/adminNotice")
	public String adminNotice(Criteria cri,Model model,HttpServletRequest req) throws Exception{
		logger.info("adminNotice...");
		model.addAttribute("list",nService.getList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,nService.getTotal(cri)));
		return "adminlayout/admin/adminNotice";
	}
	
	@GetMapping("/adminAddNotice")
	public String addNotice(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminAddNotice...");
		
		return "adminlayout/admin/adminAddNotice";
	}
	
	@PostMapping("/adminAddNoticeProcess")
	public String addNoticeProcess(NoticeVO nVo,RedirectAttributes rttr) throws Exception{
		logger.info("adminAddNoticeProcess......");
		nService.insertNotice(nVo);
		rttr.addFlashAttribute("resMsg",nVo.getTitle()+" 게시글이 작성 되었습니다.");
		return "adminlayout/admin/adminNotice";
	}
	
	@GetMapping("/adminNoticeDetail")
	public String addNoticeDetail(Criteria cri, Model model, NoticeVO vo) throws Exception{
		logger.info("adminNoticeDetail...");
		vo=nService.selectNotice(vo.getNo());
		model.addAttribute("vo",vo);
		return "adminlayout/admin/adminNoticeDetail";
	}
	
	@PostMapping("/adminUpdateNoticeProcess")
	public String updateNotice(Criteria cri, Model model, NoticeVO vo) throws Exception{
		logger.info("adminNoticeDetail...");
		nService.updateNotice(vo);
		model.addAttribute("vo",vo);
		return "adminlayout/admin/adminNoticeDetail";
	}
	
	@PostMapping("/adminDeleteNotice")
	public String deleteFlagNotice(Model model, NoticeVO vo) throws Exception{
		logger.info("adminNoticeDetail...");
		nService.deleteFlagNotice(vo);
		model.addAttribute("vo",vo);
		return "adminlayout/admin/adminNoticeDetail";
	}
	
	
	@GetMapping("/adminBooking")
	public String adminBooking(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminBooking...");
		
		return "adminlayout/admin/adminBooking";
	}
	
	
	@GetMapping("/adminConsultation")
	public String adminConsultation(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminConsultation...");
		
		return "adminlayout/admin/adminConsultation";
	}
	
	@GetMapping("/adminOption")
	public String adminOption(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminOption...");
		
		return "adminlayout/admin/adminOption";
	}
	
	
	//roomInfo
	@GetMapping("/adminRoomInfo")
	public String adminRoomInfo(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminRoomInfo...");
		System.out.println("rService.selectRoomInfoList()...."+rService.selectRoomInfoList());
		model.addAttribute("list",rService.selectRoomInfoList());
		
		return "adminlayout/admin/adminRoomInfo";
	}
	
	
}