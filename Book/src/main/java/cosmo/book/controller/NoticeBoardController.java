package cosmo.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cosmo.book.service.NoticeServiceImpl;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.PageNavi;

@Controller
@RequestMapping("/notice/*")
public class NoticeBoardController {
	
	@Autowired
	NoticeServiceImpl nService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	@GetMapping("/list")
	public String list(Criteria cri,Model model,HttpServletRequest req) throws Exception{
		logger.info("noticeList...");
		HttpSession session = req.getSession();
		model.addAttribute("list",nService.getList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,nService.getTotal(cri)));
		
		return "layout/notice/list";
	}
	
}