package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.OptionsVO;

@Mapper
public interface OptionsMapper {

	public OptionsVO selectOptions(int no);
	
	public ArrayList <OptionsVO> selectOptionsList();
	
	public int updateOptions(OptionsVO vo);
	
	public int deleteFlagOptions(OptionsVO vo);
	
	public int activityOptions(OptionsVO vo);
	
	public int insertOptions(OptionsVO vo);
	
}