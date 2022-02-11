package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.SliderimagesVO;
import cosmo.book.vo.Criteria;

@Mapper
public interface SliderImagesMapper {

	public  ArrayList <SliderimagesVO> selectSliderimages();
	
	public  ArrayList <SliderimagesVO> getSliderimagesListAtHome();
	
	public  ArrayList <SliderimagesVO> getSliderimagesListAtRoomInfo();
	
	public int getTotal(Criteria cri);
	
	public ArrayList <SliderimagesVO> getSliderimagesList(Criteria cri);
	
	public int updateSliderimages(SliderimagesVO vo);
	
	public int activitySliderimages(SliderimagesVO vo);
	
	public int deleteFlagSliderimages(SliderimagesVO vo);
	
	public void insertSliderimages(SliderimagesVO vo);
	
	public SliderimagesVO selectimage(int no);
	
	
}