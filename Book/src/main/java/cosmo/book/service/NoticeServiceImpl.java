package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.NoticeMapper;
import cosmo.book.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	public NoticeMapper nMapper;

	@Override
	public ArrayList<NoticeVO> selectNotice() {
		return nMapper.selectNotice();
	}
	
	
	
}
