package cosmo.book.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cosmo.book.service.BookingService;
import cosmo.book.service.ConsultationService;
import cosmo.book.service.NoticeService;
import cosmo.book.service.OptionsService;
import cosmo.book.service.RoomInfoService;
import cosmo.book.service.SliderImagesService;
import cosmo.book.vo.BookingVO;
import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;
import cosmo.book.vo.OptionsVO;
import cosmo.book.vo.PageNavi;
import cosmo.book.vo.RoomInfoVO;
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
	@Autowired
	OptionsService oService;
	@Autowired
	BookingService bService;
	@Autowired
	ConsultationService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@GetMapping("/adminMain")
	public String adminMain(HttpServletRequest req) throws Exception{
		logger.info("adminMain...");
		
		return "adminlayout/admin/adminMain";
	}
	
	@PostMapping(value="/activityImageProgress",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<SliderimagesVO>activityImageProgress(@RequestParam("no")String no, @RequestParam("activity")String activity) throws Exception{
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
	public ResponseEntity<SliderimagesVO>deleteImageProgress(@RequestParam("no")String no, @RequestParam("delete_flag")String delete_flag) throws Exception{
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
	
	
	///////////notice
	@GetMapping("/adminNotice")
	public String adminNotice(Criteria cri,Model model,HttpServletRequest req) throws Exception{
		logger.info("adminNotice...");
		model.addAttribute("list",nService.getList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,nService.getTotal(cri)));
		return "adminlayout/admin/adminNotice";
	}
	
	@GetMapping("/adminAddNotice")
	public String addNotice(HttpServletRequest req) throws Exception{
		logger.info("adminAddNotice...");
		
		return "adminlayout/admin/adminAddNotice";
	}
	
	@PostMapping("/adminAddNoticeProcess")
	public String addNoticeProcess(NoticeVO nVo,RedirectAttributes rttr) throws Exception{
		logger.info("adminAddNoticeProcess......");
		nService.insertNotice(nVo);
		rttr.addFlashAttribute("resMsg",nVo.getTitle()+" 게시글이 작성 되었습니다.");
		return "redirect :/admin/adminNotice";
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
		return "redirect:/admin/adminNotice";
	}
	
	@PostMapping("/adminDeleteNotice")
	public String deleteFlagNotice(Model model, NoticeVO vo) throws Exception{
		logger.info("adminNoticeDetail...");
		nService.deleteFlagNotice(vo);
		model.addAttribute("vo",vo);
		return "adminlayout/admin/adminNoticeDetail";
	}
	
	//////////////////////////booking
	@GetMapping("/adminBooking")
	public String adminBooking(Model model) throws Exception{
		logger.info("adminBooking...");
		model.addAttribute("oList",oService.selectOptionsList());
		model.addAttribute("rList",rService.selectRoomInfoList());
		model.addAttribute("bList",bService.selectBookingList());	//returns hashmap key: bookinVo.no...(PK)  object:bookingVO
		return "adminlayout/admin/adminBooking";
	}
	
	@PostMapping(value="/getFullcalendar",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<BookingVO> getFullcalendarProcess() throws Exception{
		logger.info("getFullcalendarAjaxProcess...");
		List<BookingVO> resultMap = bService.selectBookingList();
		return resultMap;
	}
	
	
	@PostMapping(value="/getBookingAjax",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<BookingVO> getBookingAjaxProcess(@RequestParam("no")String no) throws Exception{
		logger.info("getFullcalendarAjaxProcess...");
		int tmpNo=Integer.parseInt(no);
		BookingVO bVo= bService.selectBooking(tmpNo);
		System.out.println("bVO......"+bVo);
		return new ResponseEntity<BookingVO>(bVo,HttpStatus.OK);
	}
	
	@PostMapping(value="paymentFlagAjax",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int paymentFlagAjaxProcess(@RequestParam("no")String no,@RequestParam("payment_flag")String payment_flag) throws Exception{
		logger.info("paymentFlagAjaxProcess...");
		BookingVO bVo = new BookingVO();
		int tmpNo= Integer.parseInt(no);
		bVo.setNo(tmpNo);
		bVo.setPayment_flag(payment_flag);
		bService.updateBookingPaymentFlag(bVo);
		return bVo.getNo();
	}
	
	@PostMapping(value="deleteFlagAjax",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int deleteFlagAjaxProcess(@RequestParam("no")String no,@RequestParam("delete_flag")String delete_flag) throws Exception{
		logger.info("paymentFlagAjaxProcess...");
		BookingVO bVo = new BookingVO();
		int tmpNo= Integer.parseInt(no);
		bVo.setNo(tmpNo);
		bVo.setDelete_flag(delete_flag);
		bService.updateBookingDeleteFlag(bVo);
		return tmpNo;
	}
	
	@PostMapping(value="cancelFlagAjax",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int cancelFlagAjaxProcess(@RequestParam("no")String no,@RequestParam("cancel_flag")String cancel_flag) throws Exception{
		logger.info("paymentFlagAjaxProcess...");
		BookingVO bVo = new BookingVO();
		int tmpNo= Integer.parseInt(no);
		bVo.setNo(tmpNo);
		bVo.setCancel_flag(cancel_flag);
		bService.updateBookingCancelFlag(bVo);
		return tmpNo;
	}
	
	
	
	
	
	/////////////consultaion
	@GetMapping("/adminConsultation")
	public String adminConsultation(Criteria cri,Model model) throws Exception{
		logger.info("adminConsultation...");
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		return "adminlayout/admin/adminConsultation";
	}
	
	@GetMapping("/adminAddConsultation")
	public String adminAddConsultation(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("adminAddConsultationPage....");
		vo=cService.selectConsultation(vo.getNo());
		model.addAttribute("vo",vo);
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "adminlayout/admin/adminAddConsultation";
	}
	
	@PostMapping("/adminAddConsultationProcess")
	public String adminAddConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("adminAddNoticeProcess....");
		cService.insertConsultation(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/admin/adminConsultation";
	}
	@GetMapping("/adminConsultationDetail")
	public String adminConsultationDetail(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("adminConsultationDetail....");
		vo=cService.selectConsultation(vo.getNo());
		model.addAttribute("vo",vo);
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "adminlayout/admin/adminConsultationDetail";
	}
	@PostMapping("/adminUpdateConsultationProcess")
	public String adminUpdateConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("adminUpdateConsultationProcess....");
		System.out.println("cri:"+cri);
		cService.updateConsultation(vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/admin/adminConsultation";
	}
	@PostMapping("/adminlockConsultation")
	public String adminlockConsultation(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("adminlockConsultation....");
		cService.lockFlagConsultation(vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/admin/adminConsultation";
	}
	@PostMapping("/adminDeleteConsultation")
	public String adminDeleteConsultation(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("adminDeleteConsultation....");
		cService.deleteFlagConsultation(vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/admin/adminConsultation";
	}
	
	@GetMapping("/adminReplyConsultation")
	public String adminReplyConsultation(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("adminReplyConsultationProcess....");
		System.out.println("vo....."+vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "adminlayout/admin/adminAddConsultation";
	}
	
	@PostMapping("/replyAdminConsultationProgress")
	public String replyAdminConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("replyAdminConsultationProgress....");
		ConsultationVO replyVo= new ConsultationVO(vo.getGrno(),vo.getGrgrod(),vo.getDepth(),vo.getTitle(),vo.getContents(),vo.getName(),vo.getPasswd());
		cService.replyConsultation(replyVo); 
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/admin/adminConsultation";
	}
	
	
	//////////////////////options
	@GetMapping("/adminOption")
	public String adminOption(HttpServletRequest req) throws Exception{
		logger.info("adminOption...");
		
		return "adminlayout/admin/adminOption";
	}
	
	@PostMapping(value="/modifyOptionProgress" ,produces=MediaType.APPLICATION_JSON_VALUE)
	public String updateOptions(@RequestParam("no")int no, @RequestParam("cost")int cost) throws Exception{
		logger.info("modifyOptionsProgress...");
		OptionsVO oVo = new OptionsVO();
		oVo.setNo(no);
		oVo.setCost(cost);
		oService.updateOptions(oVo);
		return "redirect: /admin/adminOption";
	}
	
	@PostMapping("/deleteOptionProgress")
	public String deleteOptions(OptionsVO oVo) throws Exception{
		logger.info("deleteOptionsProgress...");
		oService.deleteFlagOptions(oVo);
		return "redirect: /admin/adminOption";
	}
	
	@PostMapping("/activityOptionProgress")
	public String activityOptions(OptionsVO oVo) throws Exception{
		logger.info("activityOptionsProgress...");
		oService.activityOptions(oVo);
		return "redirect:/admin/adminOption";
	}
	
	@PostMapping("/addOptionProgress")
	public String addOptions(@RequestParam("item")String item, @RequestParam("cost")int cost) throws Exception{
		logger.info("addOptionsProgress...");
		OptionsVO oVo = new OptionsVO();
		oVo.setItem(item);
		oVo.setCost(cost);
		oService.insertOptions(oVo);
		return "redirect: /admin/adminOption";
	}
	
	
	
	////////////////////roomInfo
	@GetMapping("/adminRoomInfo")
	public String adminRoomInfo(Model model,HttpServletRequest req) throws Exception{
		logger.info("adminRoomInfo...");
		model.addAttribute("rList",rService.selectRoomInfoList());
		model.addAttribute("sList",sService.getSliderimagesListAtRoomInfo());
		return "adminlayout/admin/adminRoomInfo";
	}
	
	
	@PostMapping(value="/getRoomInfoImageList",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ArrayList<SliderimagesVO> getRoomInfoImageList() throws Exception{
		logger.info("getRoomInfoImageListAjax...");
		ArrayList<SliderimagesVO> sList = sService.getSliderimagesListAtRoomInfo();
		System.out.println("sList.............."+sList);
		return sList;
	}
	
	@PostMapping(value="/updateRoomInfoImage",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<RoomInfoVO> updateRoomInfoImage(@RequestParam(value="no",required=true)String no, @RequestParam(value="images",required=true)String images) throws Exception{
		logger.info("updateRoomInfoImageAjax...");
		RoomInfoVO rVo= new RoomInfoVO();
		int tmpNo=Integer.parseInt(no);
		rVo.setNo(tmpNo);
		rVo.setImages(images);
		rService.updateRoomInfoImage(rVo);
		return new ResponseEntity<RoomInfoVO>(rVo,HttpStatus.OK);
	}
	
	
	@PostMapping(value="/switchingRoomInfo",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<RoomInfoVO>switchingRoomInfoProgress(@RequestBody RoomInfoVO roomInfo) throws Exception{
		logger.info("RoomInfoAjax...");
		int tmpNo = roomInfo.getNo();
		RoomInfoVO rVo= new RoomInfoVO();
		rVo.setNo(tmpNo);
		rVo=rService.selectRoomInfo(tmpNo);
		return new ResponseEntity<RoomInfoVO>(rVo, HttpStatus.OK);
	}
	
	@PostMapping("/modifyRoomInfoProgress")
	public String updateRoomInfo(Model model,RoomInfoVO roomInfoVo) throws Exception{
		logger.info("modifyRoomInfoProgress...");
		rService.updateRoomInfo(roomInfoVo);
		return "redirect: /admin/adminRoomInfo";
	}
	
	@PostMapping("/deleteRoomInfoProgress")
	public String deleteRoomInfo(Model model,RoomInfoVO roomInfoVo) throws Exception{
		logger.info("deleteRoomInfoProgress...");
		System.out.println("roomInfoVo.........."+roomInfoVo);
		rService.deleteFlagRoomInfo(roomInfoVo);
		return "redirect: /admin/adminRoomInfo";
	}
	
	@PostMapping("/addRoomInfoProgress")
	public String addRoomInfo(Model model,RoomInfoVO roomInfoVo) throws Exception{
		logger.info("addRoomInfoProgress...");
		System.out.println("insertRoomInfo..........roominfoVo........."+roomInfoVo);
		rService.insertRoomInfo(roomInfoVo);
		return "redirect: /admin/adminRoomInfo";
	}
	
}