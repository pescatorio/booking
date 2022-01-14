package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.ConsultationMapper;
import cosmo.book.mapper.NoticeMapper;
import cosmo.book.vo.ConsultationVO;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

@Service
public class ConsultationServiceImpl implements ConsultationService{

	@Autowired
	public ConsultationMapper cMapper;


	@Override
	public ConsultationVO selectConsultation(int no) {
		return cMapper.selectConsultation(no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return cMapper.getTotal(cri);
	}

	@Override
	public ArrayList<ConsultationVO> getList(Criteria cri) {
		return cMapper.getList(cri);
	}

	@Override
	public int updateConsultation(ConsultationVO vo) {
		return cMapper.updateConsultation(vo);
	}

	@Override
	public int deleteFlagConsultation(ConsultationVO vo) {
		return cMapper.deleteFlagConsultation(vo);
	}

	@Override
	public int insertConsultation(ConsultationVO vo) {
		return cMapper.insertConsultation(vo);
	}
	
	
	
}