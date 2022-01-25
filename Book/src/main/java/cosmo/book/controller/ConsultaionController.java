package cosmo.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cosmo.book.mapper.ConsultationMapper;
import cosmo.book.service.ConsultationService;
import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;
import cosmo.book.vo.PageNavi;

@Controller
@RequestMapping("/consultation/*")
public class ConsultaionController {
	
	
	@Autowired
	private ConsultationService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(ConsultaionController.class);
	
	@GetMapping("/page")
	public String list(Criteria cri,Model model) throws Exception{
		logger.info("consultationpage...");
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		return "layout/consultation/page";
	}
	
	@GetMapping("/detail")
	public String detail(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("detail....");
		vo=cService.selectConsultation(vo.getNo());
		model.addAttribute("vo",vo);
		
		return "layout/consultation/detail";
	}
	
	@GetMapping("/addConsultation")
	public String addConsultation(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("addConsultationPage....");
		vo=cService.selectConsultation(vo.getNo());
		model.addAttribute("vo",vo);
		
		return "layout/consultation/addConsultation";
	}
	
	@PostMapping("/addConsultationProcess")
	public String addConsultation(Model model, ConsultationVO vo) {
		logger.info("addConsultationProcess....");
		cService.insertConsultation(vo);
		model.addAttribute("vo",vo);
		return "layout/consultation/page";
	}
	
	@GetMapping("/modifyConsultation")
	public String modifyConsultation(Criteria cri, Model model, ConsultationVO vo, @RequestParam(value="cName", required = false) String cName,@RequestParam(value="cPasswd", required=false) String cPasswd) {
		logger.info("modifyConsultationPage....");
		vo=cService.selectConsultation(vo.getNo(), cName,  cPasswd);
		if(vo==null)
			return "layout/consultation/page";
		model.addAttribute("vo",vo);
		return "layout/consultation/modifyConsultation";
	}
	
}