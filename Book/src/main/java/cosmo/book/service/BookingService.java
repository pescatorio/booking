package cosmo.book.service;

import java.util.ArrayList;

import cosmo.book.vo.BookingVO;
import cosmo.book.vo.Criteria;

public interface BookingService {
	
	public BookingVO selectBooking(int no);
	
	public int getTotal(Criteria cri);
	
	public ArrayList <BookingVO> getList(Criteria cri);
	
	public int updateBooking(BookingVO vo);
	
	public int deleteFlagBooking(BookingVO vo);
	
	public int insertBooking(BookingVO vo);
}
