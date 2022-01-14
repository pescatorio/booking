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
	public int getTotal(Criteria cri) {
		return oMapper.getTotal(cri);
	}

	@Override
	public ArrayList<OptionsVO> getList(Criteria cri) {
		return oMapper.getList(cri);
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
	
	
	
}
