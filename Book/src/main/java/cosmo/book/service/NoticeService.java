package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

public interface NoticeService {
	
	public NoticeVO selectNotice(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <NoticeVO> getList(Criteria cri);
	
	public int updateNotice(NoticeVO vo);
	
	public int deleteFlagNotice(NoticeVO vo);
	
	public int insertNotice(NoticeVO vo);
}
