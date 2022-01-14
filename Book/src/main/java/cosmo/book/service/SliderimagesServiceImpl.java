package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.SliderimagesMapper;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.SliderimagesVO;

@Service
public class SliderimagesServiceImpl implements SliderimagesService{

	@Autowired
	public SliderimagesMapper rMapper;


	@Override
	public SliderimagesVO selectSliderimages(int no) {
		return rMapper.selectSliderimages(no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return rMapper.getTotal(cri);
	}

	@Override
	public ArrayList<SliderimagesVO> getList(Criteria cri) {
		return rMapper.getList(cri);
	}

	@Override
	public int updateSliderimages(SliderimagesVO vo) {
		return rMapper.updateSliderimages(vo);
	}

	@Override
	public int deleteFlagSliderimages(SliderimagesVO vo) {
		return rMapper.deleteFlagSliderimages(vo);
	}

	@Override
	public int insertSliderimages(SliderimagesVO vo) {
		return rMapper.insertSliderimages(vo);
	}
	
	
	
}
