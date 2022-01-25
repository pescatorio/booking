package cosmo.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cosmo.book.service.NoticeService;
import cosmo.book.service.NoticeServiceImpl;
import cosmo.book.service.RoomInfoService;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;
import cosmo.book.vo.PageNavi;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	NoticeService nService;
	@Autowired
	RoomInfoService rService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@GetMapping("/adminMain")
	public String adminMain(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminMain...");
		
		return "adminlayout/admin/adminMain";
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