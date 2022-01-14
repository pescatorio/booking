package cosmo.book.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	public NoticeVO selectNotice(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <NoticeVO> getList(Criteria cri);
	
	public int updateNotice(NoticeVO vo);
	
	public int deleteFlagNotice(NoticeVO vo);
	
	public int insertNotice(NoticeVO vo);
}