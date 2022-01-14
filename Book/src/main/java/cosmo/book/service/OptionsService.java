package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.OptionsVO;

public interface OptionsService {
	
	public OptionsVO selectOptions(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <OptionsVO> getList(Criteria cri);
	
	public int updateOptions(OptionsVO vo);
	
	public int deleteFlagOptions(OptionsVO vo);
	
	public int insertOptions(OptionsVO vo);
}
