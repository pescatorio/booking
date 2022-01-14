package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.NoticeMapper;
import cosmo.book.vo.Criteria;
import cosmo.book.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	public NoticeMapper nMapper;


	@Override
	public NoticeVO selectNotice(int no) {
		return nMapper.selectNotice(no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return nMapper.getTotal(cri);
	}

	@Override
	public ArrayList<NoticeVO> getList(Criteria cri) {
		return nMapper.getList(cri);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return nMapper.updateNotice(vo);
	}

	@Override
	public int deleteFlagNotice(NoticeVO vo) {
		return nMapper.deleteFlagNotice(vo);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		return nMapper.insertNotice(vo);
	}
	
	
	
}
