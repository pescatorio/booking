package cosmo.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.NoticeMapper;
import cosmo.book.vo.NoticeVO;
import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	public NoticeMapper nMapper;

	@Override
	public NoticeVO selectNotice() {
		return nMapper.selectNotice();
	}
	
	
	
}
