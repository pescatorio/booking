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
		if(vo.getDelete_flag().equals("1")) {
			vo.setDelete_flag("0");
		}else {
			vo.setDelete_flag("1");
		}
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
		if(vo.getActivity().equals("1")) {
			vo.setActivity("0");
		}else {
			vo.setActivity("1");
		}
		return oMapper.activityOptions(vo);
	}
	
	
	
}
