package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cosmo.book.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	public ArrayList<NoticeVO> selectNotice();
	
	@Select("select now()")
	public String getTime();
		
}
