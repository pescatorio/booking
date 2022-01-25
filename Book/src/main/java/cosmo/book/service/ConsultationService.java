package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;

public interface ConsultationService {
	
	public ConsultationVO selectConsultation(int no);
	
	public ConsultationVO selectConsultation(int no,String cName, String cPasswd);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <ConsultationVO> selectConsultationList(Criteria cri);
	
	public int updateConsultation(ConsultationVO vo);
	
	public int deleteFlagConsultation(ConsultationVO vo);
	
	public int insertConsultation(ConsultationVO vo);
}
