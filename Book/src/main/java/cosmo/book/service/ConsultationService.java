package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

public interface ConsultationService {
	
	public ConsultationVO selectConsultation(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <ConsultationVO> getList(Criteria cri);
	
	public int updateConsultation(ConsultationVO vo);
	
	public int deleteFlagConsultation(ConsultationVO vo);
	
	public int insertConsultation(ConsultationVO vo);
}
