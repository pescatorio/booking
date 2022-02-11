package cosmo.book.service;

import java.util.List;
import java.util.Map;

import cosmo.book.vo.BookingVO;

public interface BookingService {
	
	public BookingVO selectBooking(int no);
	
	public Map<String,BookingVO> selectBookingMap();
	
	public List<BookingVO> selectBookingList();
	
	public List<String> selectPeriod(int room_no);
	
	public int updateBooking(BookingVO vo);
	
	public void updateBookingPaymentFlag(BookingVO vo);
	
	public void updateBookingDeleteFlag(BookingVO vo);
	
	public void updateBookingCancelFlag(BookingVO vo);
	
	public int insertBooking(BookingVO vo);
}
