package cosmo.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cosmo.book.mapper.BookingMapper;
import cosmo.book.vo.BookingVO;
import cosmo.book.vo.Criteria;

@Service
public class BookingServiceInpl implements BookingService{

	@Autowired
	public BookingMapper bMapper;


	@Override
	public BookingVO selectBooking(int no) {
		return bMapper.selectBooking(no);
	}
	

	@Override
	public int getTotal(Criteria cri) {
		return bMapper.getTotal(cri);
	}

	@Override
	public ArrayList<BookingVO> getList(Criteria cri) {
		return bMapper.getList(cri);
	}

	@Override
	public int updateBooking(BookingVO vo) {
		return bMapper.updateBooking(vo);
	}

	@Override
	public int deleteFlagBooking(BookingVO vo) {
		return bMapper.deleteFlagBooking(vo);
	}

	@Override
	public int insertBooking(BookingVO vo) {
		return bMapper.insertBooking(vo);
	}
	
	
	
}
