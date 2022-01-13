package cosmo.book.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cosmo.book.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	public NoticeVO selectNotice();
	
	@Select("select now()")
	public String getTime();
		
}
