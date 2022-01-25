package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

@Mapper
public interface ConsultationMapper {

	public ConsultationVO selectConsultation(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <ConsultationVO> selectConsultationList(Criteria cri);
	
	public int updateConsultation(ConsultationVO vo);
	
	public int deleteFlagConsultation(ConsultationVO vo);
	
	public int insertConsultation(ConsultationVO vo);
}