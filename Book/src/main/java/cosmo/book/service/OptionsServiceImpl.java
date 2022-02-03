package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.OptionsMapper;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.OptionsVO;

@Service
public class OptionsServiceImpl implements OptionsService{

	@Autowired
	public OptionsMapper oMapper;


	@Override
	public OptionsVO selectOptions(int no) {
		return oMapper.selectOptions(no);
	}


	@Override
	public int updateOptions(OptionsVO vo) {
		return oMapper.updateOptions(vo);
	}

	@Override
	public int deleteFlagOptions(OptionsVO vo) {
		return oMapper.deleteFlagOptions(vo);
	}

	@Override
	public int insertOptions(OptionsVO vo) {
		return oMapper.insertOptions(vo);
	}


	@Override
	public ArrayList<OptionsVO> selectOptionsList() {
		return oMapper.selectOptionsList();
	}


	@Override
	public int activityOptions(OptionsVO vo) {
		return activityOptions(vo);
	}
	
	
	
}
