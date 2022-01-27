package cosmo.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cosmo.book.service.ConsultationService;
import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
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
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "layout/consultation/detail";
	}
	
	@GetMapping("/addConsultation")
	public String addConsultation(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("addConsultationPage....");
		vo=cService.selectConsultation(vo.getNo());
		model.addAttribute("vo",vo);
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "layout/consultation/addConsultation";
	}
	
	@PostMapping("/addConsultationProcess")
	public String addConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("addConsultationProcess....");
		cService.insertConsultation(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/consultation/page";
	}
	
	@GetMapping("/modifyConsultation")
	public String modifyConsultation(Criteria cri, Model model, ConsultationVO vo,@RequestParam(value="cPasswd", required=false) String cPasswd) 
	throws NullPointerException{
		logger.info("modifyConsultationPage....");
				vo=cService.selectConsultation(vo.getNo(),  cPasswd);
				if(vo==null) {
					return "layout/error/error";
				}else {
					model.addAttribute("vo",vo);
					model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

					return "layout/consultation/modifyConsultation";
			}
	}
	
	@PostMapping("/modifyConsultationProcess")
	public String modifyConsultation(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("modifyConsultationProcess....");
		System.out.println("cri:"+cri);
		cService.updateConsultation(vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/consultation/page";
	}
	
	@PostMapping("/lockFlagConsultationProcess")
	public String lockFlagConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("modifyConsultationProcess....");
		cService.lockFlagConsultation(vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/consultation/page";
	}
	
	@GetMapping("/replyConsultation")
	public String replyConsultation(Criteria cri, Model model, ConsultationVO vo) {
		logger.info("replyConsultationProcess....");
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));

		return "layout/consultation/addConsultation";
	}
	
	@PostMapping("/replyConsultationProgress")
	public String replyConsultationProcess(Criteria cri, Model model, ConsultationVO vo,RedirectAttributes rttr) {
		logger.info("addConsultationProcess....");
		ConsultationVO replyVo= new ConsultationVO(vo.getGrno(),vo.getGrgrod(),vo.getDepth(),vo.getTitle(),vo.getContents(),vo.getName(),vo.getPasswd());
		cService.replyConsultation(replyVo); 
		model.addAttribute("vo",vo);
		model.addAttribute("list",cService.selectConsultationList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,cService.getTotal(cri)));
		rttr.addFlashAttribute("resMsg", "success");
		return "redirect:/consultation/page";
	}
}