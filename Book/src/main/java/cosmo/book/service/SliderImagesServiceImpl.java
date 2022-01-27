package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.SliderImagesMapper;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.SliderimagesVO;

@Service
public class SliderImagesServiceImpl implements SliderImagesService{

	@Autowired
	public SliderImagesMapper sMapper;


	@Override
	public  ArrayList <SliderimagesVO> selectSliderimages(){
		return sMapper.selectSliderimages();
	}
	
	@Override
	public  ArrayList <SliderimagesVO> getSliderimagesListAtHome(){
		return sMapper.getSliderimagesListAtHome();
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return sMapper.getTotal(cri);
	}

	@Override
	public ArrayList<SliderimagesVO> getSliderimagesList(Criteria cri) {
		return sMapper.getSliderimagesList(cri);
	}

	@Override
	public int updateSliderimages(SliderimagesVO vo) {
		return sMapper.updateSliderimages(vo);
	}

	@Override
	public int deleteFlagSliderimages(SliderimagesVO vo) {
		return sMapper.deleteFlagSliderimages(vo);
	}
	
	@Override
	public int activitySliderimages(SliderimagesVO vo) {
		return sMapper.activitySliderimages(vo);
	}

	@Override
	public void insertSliderimages(SliderimagesVO vo) {
		sMapper.insertSliderimages(vo);
	}

	@Override
	public SliderimagesVO selectimage(int no) {
		return sMapper.selectimage(no);
	}
	
	
	
}
