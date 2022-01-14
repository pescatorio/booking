package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.SliderimagesVO;
import cosmo.book.vo.Criteria;

@Mapper
public interface SliderimagesMapper {

	public SliderimagesVO selectSliderimages(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <SliderimagesVO> getList(Criteria cri);
	
	public int updateSliderimages(SliderimagesVO vo);
	
	public int deleteFlagSliderimages(SliderimagesVO vo);
	
	public int insertSliderimages(SliderimagesVO vo);
}