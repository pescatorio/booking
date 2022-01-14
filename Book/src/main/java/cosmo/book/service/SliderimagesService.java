package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.SliderimagesVO;
import cosmo.book.vo.Criteria;

public interface SliderimagesService {
	
	public SliderimagesVO selectSliderimages(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <SliderimagesVO> getList(Criteria cri);
	
	public int updateSliderimages(SliderimagesVO vo);
	
	public int deleteFlagSliderimages(SliderimagesVO vo);
	
	public int insertSliderimages(SliderimagesVO vo);
}
